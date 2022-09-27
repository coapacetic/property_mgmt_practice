with source as (
    select * from {{ source('property_management', 'vendors') }}
),

staged as (
    select
        -- ids
        id as vendor_id,
        contact_info_id,
        bank_account_id,

        -- timestamps
        created_at,
        uploaded_at

    from source
)

select * from staged