CREATE OR ALTER PROCEDURE ${flyway:defaultSchema}.generate_date_periods @initial_date char(8) = '20200203'
AS
BEGIN
    DECLARE @start_date AS DATE
    DECLARE @current_date AS DATE
    DECLARE @date_periods AS TABLE (date_period VARCHAR(8))

    SET @start_date = CONVERT(date, @initial_date, 112)
    SET @current_date = GETUTCDATE()

    WHILE @start_date < @current_date
        BEGIN
            INSERT INTO @date_periods SELECT CONVERT(CHAR(8), @start_date, 112)
            SET @start_date = DATEADD(DD, 1, @start_date)
        END

    SELECT date_period FROM @date_periods
END
GO