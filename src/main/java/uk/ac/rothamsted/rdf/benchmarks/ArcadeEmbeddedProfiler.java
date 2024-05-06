package uk.ac.rothamsted.rdf.benchmarks;

import com.arcadedb.database.Database;
import com.arcadedb.database.DatabaseFactory;
import com.arcadedb.query.sql.executor.ResultSet;
import uk.ac.ebi.utils.time.XStopWatch;

/**
 * TODO: comment me!
 *
 * @author Luca Garulli (l.garulli@arcadedata.com)
 * <dl><dt>Date:</dt><dd>21 July 2023</dd></dl>
 */
public class ArcadeEmbeddedProfiler extends AbstractProfiler {
  private String dbName;

  public ArcadeEmbeddedProfiler(String basePath, String dbName) {
    this();
    this.basePath = basePath;
    this.dbName = dbName;
  }

  public ArcadeEmbeddedProfiler() {
    super("gremlin");
  }

  @Override
  protected long profileQuery(String name) {
    String gremlinQuery = getQueryString(name);

    try {
      return XStopWatch.profile(() -> {
        try (DatabaseFactory factory = new DatabaseFactory(dbName); Database database = factory.open()) {
          ResultSet rs = database.query("gremlin", gremlinQuery);
          rs.forEachRemaining(row -> row.toJSON());
        }
      });
    } catch (Exception ex) {
      log.error("Error while running {}, query is:\n{}\nError is:", name, gremlinQuery, ex);

      // Count it as failed
      return -1;
    }
  }
}
