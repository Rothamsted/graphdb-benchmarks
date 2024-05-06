let vertexTypes = ( select name from schema:types where type = 'vertex' );
let total = 0;
FOREACH( vertexType IN $vertexTypes ){
  let count = ( select count(*) as count from $vertexType.name );
  let total = $total + $count[0].count;
}
return $total;