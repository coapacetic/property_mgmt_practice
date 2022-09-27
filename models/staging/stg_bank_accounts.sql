with source as (
    select * from {{ source('property_management', 'bank_accounts') }}
),

staged as (
    select
        -- ids
        id as bank_account_id,
        
        -- descriptions
        name as name,
        bank_account_number,
        routing_number

        -- timestamps
        created_at,
        uploaded_at

    from source
    order by 1 asc
)

select * from staged