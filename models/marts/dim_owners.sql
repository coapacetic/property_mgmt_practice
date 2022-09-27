with owners as (
    select * from {{ ref('stg_owners') }}
),

contact_infos as (
    select * from {{ ref('stg_contact_infos') }}
),

bank_accounts as (
    select * from {{ ref('stg_bank_accounts') }}
),

joined as (
    select 
        owners.owner_id,
        contact_infos.first_name,
        contact_infos.last_name,
        contact_infos.email_address,
        bank_accounts.name,
        bank_accounts.bank_account_number 
    from owners
    left join contact_infos on owners.contact_info_id = contact_infos.contact_info_id
    left join bank_accounts on owners.bank_account_id = bank_accounts.bank_account_id
)

select * from joined
