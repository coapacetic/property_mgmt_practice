with source as (
    select * from {{ source('property_management', 'tenants') }}
),

staged as (
    select
        -- ids
        id as tenant_id,
        contact_info_id,
        bank_account_id,
        lease_id,
    
        -- description
        move_in_date,
        move_out_date
        notice_date,

        -- timestamps
        created_at,
        uploaded_at
    
    from source
)

select * from staged