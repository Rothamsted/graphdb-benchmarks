import pandas as pd
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

from IPython.display import display
from IPython.core.display import HTML

from matplotlib.ticker import ScalarFormatter


# Conventional top value to represent timed out results
# We set up the database servers with a time out of 20s to complete the queries. Some of them returned 
# results with a total clocked time of 20 + a few more secs. That's due to overheads like network latency, 
# or data stream processing. This value here is a threshold well above all the results.
INF_VALUE = 25E3 


"""
  Loads the raw results stored for benchmark datasets and databases and returns the corresponding
  DataFrame(s)
"""
def get_raw_results ( datasets, databases ):
  raw_results = {}
  for dataset in datasets.keys():
    for db in databases.keys():
      combo = f"{dataset}-{db}"
      raw_res_path = f"{combo}-results.tsv"
      raw_res = pd.read_csv ( raw_res_path, sep = "\t" )
      raw_res.set_index ( "Name", inplace = True, drop = False )
      raw_results [ combo ] = raw_res
  return raw_results

"""
  Gets the summary table about a given group of queries
"""
def get_summary_data ( datasets, databases, all_queries, raw_results, qgroup ):
  def get_group_data ( raw_data, queries ):
    gdata = raw_data [ raw_data [ 'Name' ].isin ( queries ) ]
    gdata = gdata [ [ 'Name', 'AvgTime', 'STD' ] ] 
    return gdata

  gdata = pd.DataFrame ()
  queries = all_queries [ qgroup ]
  for dataset in datasets.keys ():
    for db in databases.keys():
      combo = f"{dataset}-{db}"

      qdata = raw_results [ combo ]
      qdata = get_group_data ( qdata, queries )

      was_empty = gdata.empty
      ylabel = datasets [ dataset ] + "/" + databases [ db ]
      gdata [ ylabel + " Time" ] = qdata [ "AvgTime" ].copy ()
      gdata [ ylabel + " sdev" ] = qdata [ "STD" ].copy ()

      if was_empty:
        gdata.set_index ( qdata [ "Name" ].copy (), inplace = True )
        gdata.index_name = "Queries"
  
  return gdata

"""
  Uses get_summary_data() to build all the summary data for all the query groups.
  At the same time, builds Jupyter visualisations of per-group summaries,
  using HTML() and display().
"""
def get_all_summary_data ( datasets, databases, all_queries, raw_results ):
  data_summaries = {}      
  for qgroup in all_queries.keys ():
    gdata = get_summary_data ( datasets, databases, all_queries, raw_results, qgroup )
    data_summaries [ qgroup ] = gdata
    display ( HTML ( f"<h3>Group: {qgroup}</h3>" ) )
    display ( gdata )
  return data_summaries


"""
  All the charts. See the main Notebook for info on the parameters
"""
def query_charts ( datasets, databases, all_queries, data_summaries ):
  
  # Assigns bar colors based on the DB
  def get_db_color ( db ):
    colors = { "sparql": "Blue", "neo": "Green", "arcade": "Red", "arcsql": "DarkRed" }
    return colors [ db ]

  # Assigns bar hatch patterns based on the dataset 
  def get_dataset_hatch ( dset ):
    hatches = { "biopax": "///", "arabidopsis": "\\\\\\", "poaceae": "XXX" }
    return hatches [ dset ]

  """
  Gets the x vector to locate the ibar (starts at 0) correctly, assuming you want have nbars 
  vertical bars of each of the nlabels labels, and all the bars will take wbar_total units of 
  width, where the bar groups (ie, each label) are spaced 1 unit from each other.

  Returns (the x vector, the single bar width, the next ibar ).

  The method is based on:
  https://matplotlib.org/3.1.1/gallery/lines_bars_and_markers/barchart.html#sphx-glr-gallery-lines-bars-and-markers-barchart-py

  """
  def bar_get_xs ( ibar, nbars, nlabels, wbar_total = 0.8 ):
    x = np.arange ( nlabels )
    # wbar_total = 0.8 # Because x = 0, 1, 2, you've a total of 1
    wbar = wbar_total / nbars 
    xi = x - wbar_total / 2  + wbar / 2 + ibar * wbar
    return (xi, wbar, ibar + 1)

  """
  Sets the x ticks that match what was computed by get_bar_xs()
  """
  def bar_set_xticks ( ax, nlabels ):
    x = np.arange ( nlabels )
    ax.set_xticks ( x )

  """
  Draws the bar chart for a given query group
  """
  def qgroup_chart ( qgroup ):
    gdata = data_summaries [ qgroup ]
      
    # In these cases, all queries timed out
    gdata = gdata.replace ( np.inf, INF_VALUE ) 

    fig, ax = plt.subplots()
    nbars = len ( datasets.keys () ) * len ( databases.keys() )
    nlabels = len ( gdata.index )
    ibar = 0

    # One bar per each combo of dataset/database
    #   
    for dataset in datasets.keys ():
      for db in databases.keys():
        combo_prefx = datasets [ dataset ] + "/" + databases [ db ]
        ylabel = combo_prefx
        
        yid = combo_prefx + " Time"
        y = gdata [ yid ]

        # Tried to show errors, but the log scale distorts and confuse things, plus
        # <1 values yield errors
        #yerr_id = combo_prefx + " sdev"
        #yerr = gdata [ yerr_id ].tolist ()
          
        ycolor = get_db_color ( db )
        yhatch = get_dataset_hatch ( dataset )

        xi, wbar, ibar = bar_get_xs ( ibar, nbars, nlabels )
          
        ax.bar ( xi, y, width = wbar, label = ylabel, 
          color = ycolor, edgecolor = "DarkGrey", hatch = yhatch, log = True )

    bar_set_xticks ( ax, nlabels )
    ax.set_xticklabels ( gdata.index )

    ax.set_xlabel ( qgroup )
    ax.set_ylabel ( "ms" )

    # To cope with y = 0 in log scale and to have the same range in each chart
    ax.set_ylim ( ymin = 0.1, ymax = 1E5 if nbars > 4 else 1E3 + 1000 )

    # No sci notation, but 10000 takes more space
    #ax.yaxis.set_major_formatter ( ScalarFormatter () ) 

    ax.grid ( axis = "y", which = "both", linestyle = 'dotted' )
    ax.legend ( loc = "upper center", ncol = 3 if nbars > 4 else 4, framealpha = 0.7 );
      
    # Give it a good size
    ax.figure.set_size_inches ( 13, 5.5 )

    # And save!
    img_fmt = "svg"
    basename = "querying-results"
    if "arcsql" in databases: basename += "-arcsql"
    ax.figure.savefig ( f"{basename}-{qgroup}.{img_fmt}", format = img_fmt )

  # /end: qgroup_chart()

  for qgroup in all_queries.keys ():
    qgroup_chart ( qgroup )  

# /end: query_charts()
