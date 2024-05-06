let edgeTypes = ( select name from schema:types where type = 'edge' );
let total = 0;
FOREACH( edgeType IN $edgeTypes ){
  let count = ( select count(*) as count from $edgeType.name );
  let total = $total + $count[0].count;
}
return $total;