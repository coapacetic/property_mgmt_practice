with source as (
    select * from {{ source('property_management', 'property_owners') }}
),

staged as (
    select
        -- ids
        id as property_owner_id,
        property_id,
        owner_id,

        -- timestamps
        uploaded_at
    
    from source
)

select * from staged