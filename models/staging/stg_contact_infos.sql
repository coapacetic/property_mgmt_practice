with source as (
    select * from {{ source('property_management', 'contact_infos') }}
),

staged as (
    select
        -- ids
        id as contact_info_id,

        -- descriptions
        first_name,
        last_name,
        email_address,
        phone_number

        -- timestamps
        created_at,
        uploaded_at
        
    from source
)

select * from staged