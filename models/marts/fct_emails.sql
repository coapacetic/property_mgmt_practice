with emails as (
    select * from {{ ref('stg_emails') }}
),

email_statuses as (
    select * from {{ ref('stg_email_delivery_statuses') }}
    where event != 'processing' 
),

joined as (
    select 
        emails.email_id,
        emails.subject,
        emails.body,
        emails.sent_at,
        emails.delivered_at,
        email_statuses.event as status
    from emails
    left join email_statuses on emails.email_id = email_statuses.email_id
)

select * from joined