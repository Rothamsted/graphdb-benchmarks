package uk.ac.rothamsted.rdf.benchmarks;

import com.arcadedb.query.sql.executor.ResultSet;
import com.arcadedb.remote.RemoteDatabase;

import uk.ac.ebi.utils.time.XStopWatch;

/**
 * TODO: comment me!
 *
 * @author Marco Brandizi
 * <dl><dt>Date:</dt><dd>6 May 2024</dd></dl>
 *
 */
public class ArcadeProfilerSql extends AbstractProfiler
{
  private String host, dbName, dbUser, dbPasswd;
  private int port;

  public ArcadeProfilerSql (String basePath, String host, int port, String dbName, String dbUser, String dbPasswd)
  {
    this();
    this.basePath = basePath;
    this.host = host;
    this.port = port;
    this.dbName = dbName;
    this.dbUser = dbUser;
    this.dbPasswd = dbPasswd;
    this.port = port;
  }

  /**
   * Defaults to port == {@link RemoteDatabase#DEFAULT_PORT}
   */
  public ArcadeProfilerSql (String basePath, String host, String dbName, String user, String passwd) {
    this(basePath, host, RemoteDatabase.DEFAULT_PORT, dbName, user, passwd);
  }

  /**
   * Defaults to localhost, default port and root user
   */
  public ArcadeProfilerSql (String basePath, String dbName, String passwd) {
    this(basePath, "localhost", dbName, "root", passwd);
  }

  public ArcadeProfilerSql () {
    super("sql");
  }

  @Override
  protected long profileQuery(String name) {
    String sqlQuery = getQueryString(name);

    try {
      return XStopWatch.profile(() -> {
        try (RemoteDatabase database = new RemoteDatabase(host, port, dbName, dbUser, dbPasswd)) {
          final String language = sqlQuery.contains(":") ? "sqlscript" : "sql";
          ResultSet rs = database.query(language, sqlQuery);
          rs.forEachRemaining(row -> row.toJSON());
        }
      });
    } 
    catch (Exception ex)
    {
      log.error ( "Error while running {}, query is:\n{}\nError is:", name, sqlQuery, ex );

      // Count it as failed
      return -1;
    }
  }
}
