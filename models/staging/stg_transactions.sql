with source as (
    select * from {{ source('property_management', 'transactions') }}
),

staged as (
    select
        -- ids
        id as transaction_id,
        
        -- descriptions
        type,
        payer,
        payee,
        amount,

        -- timestamps
        created_at,
        uploaded_at
        
    from source
)

select * from staged