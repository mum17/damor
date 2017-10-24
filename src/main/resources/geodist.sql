DELIMITER $$

DROP FUNCTION IF EXISTS geodist $$
CREATE FUNCTION geodist (
  src_lat double, src_lon double,
  dst_lat double, dst_lon double
) RETURNS double DETERMINISTIC
BEGIN
  SET @dist := 3956 * 2 * ASIN(SQRT(
      POWER(SIN((src_lat - ABS(dst_lat)) * PI()/180 / 2), 2) +
      COS(src_lat * PI()/180) *
      COS(ABS(dst_lat) * PI()/180) *
      POWER(SIN((src_lon - dst_lon) * PI()/180 / 2), 2)
    ));
  RETURN @dist;
END $$


DELIMITER ;