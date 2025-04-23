{% test _is_less_than_or_equal_to(model, column_name, compare_to) %}
    SELECT
        *
    FROM {{ model }}
    WHERE 
        {{ column_name }} IS NOT NULL
        AND {{ compare_to }} IS NOT NULL
        AND NOT ({{ column_name }} <= {{ compare_to }})
{% endtest %}