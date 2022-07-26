with source as (
    select * from {{ source('property_management', 'emails') }}
),

staged as (
    select
        -- ids
        id as email_id,

        -- descriptions
        subject,
        body,

        -- timestamps
        created_at,
        sent_at,
        delivered_at,
        uploaded_at
    
    from source
)

select * from staged