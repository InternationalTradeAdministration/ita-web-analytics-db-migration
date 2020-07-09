CREATE OR ALTER PROCEDURE ${flyway:defaultSchema}.generate_date_range_periods @initial_date char(8) = '20200203'
AS
BEGIN
    DECLARE @start_date AS date
    DECLARE @end_date AS date
    DECLARE @today AS date
    DECLARE @first_day_of_this_month AS date
    DECLARE @date_range_periods AS TABLE (date_range_period nvarchar(17))

    SET @today = GETUTCDATE() AT TIME ZONE 'Eastern Standard Time'
    SET @first_day_of_this_month = DATEFROMPARTS(YEAR(@today), MONTH(@today), 1)
    SET @start_date = CONVERT(date, @initial_date, 112)
    SET @end_date = EOMONTH(@start_date)

    WHILE @end_date < @first_day_of_this_month
        BEGIN
            INSERT INTO @date_range_periods
            SELECT CONCAT(CONVERT(CHAR(8), @start_date, 112), '_', CONVERT(CHAR(8), @end_date, 112))

            SET @start_date = DATEADD(dd, 1, @end_date)
            SET @end_date = EOMONTH(@start_date)
        END

    INSERT INTO @date_range_periods VALUES ('this_month')

    SELECT date_range_period FROM @date_range_periods
END
GO