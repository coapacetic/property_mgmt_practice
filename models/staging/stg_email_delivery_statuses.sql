with source as (
    select * from {{ source('property_management', 'email_delivery_statuses') }}
),

staged as (
    select
        -- ids
        id as email_delivery_status_id,
        email_id,
        -- descriptions
        event,

        -- timestamps
        created_at,
        uploaded_at

    from source
)

select * from staged