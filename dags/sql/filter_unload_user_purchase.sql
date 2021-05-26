COPY (
	SELECT invoice_number,
		stock_code,
		detail,
		quantity,
		invoice_code,
		unit_price,
		customer_id,
		country
	FROM retail.user_purchase
	WHERE quantity > 2
	AND CAST(invoice_date as date)='{{ ds }}'
      )
TO '{{ params.temp_filtered_user_puchase }}' WITH (FORMAT CSV, HEADER);

