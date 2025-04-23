{% test _is_integer_or_null(model, column_name) %}
  SELECT 
    * 
  FROM {{ model }}
  WHERE 
    {{ column_name }} IS NOT NULL 
    AND {{ column_name }}::text !~ '^[0-9]+$'  -- Regex check on text-cast column
{% endtest %}
