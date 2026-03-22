# Laravel + Vue 3 DigitalOcean reseller blueprint

## Goal
Build a bright, modern reseller application that lets customers in Myanmar-friendly payment environments buy DigitalOcean-backed services through your account, while ensuring DigitalOcean resources are created only after manual payment approval.

## Recommended stack
- **Backend:** Laravel 12, PHP 8.3, MySQL or PostgreSQL, Redis queues, Laravel Horizon.
- **Frontend:** Vue 3, Vite, Tailwind CSS, Headless UI, bright glassmorphism design system.
- **Authentication:** Laravel Breeze or Jetstream + Socialite for Google login.
- **Media handling:** Private storage for uploaded slips, signed download URLs, image validation.
- **Provisioning:** Laravel queued jobs using a service class that shells out to `doctl`.
- **Email:** Laravel notifications for order updates and credentials delivery.

## Context boundaries
- **Storefront:** public pages, customer auth, product catalog, configurator, cart, checkout, order status.
- **Management panel:** all routes prefixed with `/management`, isolated layout, admin auth, stricter authorization.

## Core domain model
1. **users**
   - customer/admin roles
   - email verification state
   - Google provider linkage
2. **payment_methods**
   - name, slug, instructions, account metadata, QR image, enabled state
   - review requirements such as transaction suffix length
3. **products**
   - display name, slug, provider type, active state
   - pricing strategy and provisioning template
4. **product_variants / product_fields**
   - schema describing configurable options such as region, CPU, RAM, backups, DB engine
5. **carts / cart_items**
   - persistent draft configuration before checkout
6. **orders / order_items**
   - immutable purchase snapshot storing submitted configuration and price breakdown
7. **payments**
   - selected payment method, slip path, submitted transaction suffix, review notes
8. **payment_reviews**
   - admin decision, reviewer, timestamps, rejection reason
9. **provisioning_jobs**
   - order item linkage, command payload, status, command output, retries, external resource ids
10. **refunds**
    - reason, operator, amount, payout state, evidence notes
11. **credential_deliveries**
    - encrypted secret payload, email delivery timestamp, access audit
12. **audit_logs**
    - who changed what, before/after values where appropriate

## Order lifecycle
- `draft`
- `pending_payment_submission`
- `awaiting_payment_review`
- `payment_rejected`
- `payment_approved`
- `provisioning`
- `active`
- `provisioning_failed`
- `refund_pending`
- `refunded`

## Provisioning flow
1. Customer submits order and manual payment proof.
2. Admin reviews proof in `/management/orders/{order}`.
3. Approval dispatches a queued provisioning action.
4. Job executes a product-specific command builder such as:
   - droplet → `doctl compute droplet create ...`
   - managed database → `doctl databases create ...`
5. Job records command output, provider resource identifiers, and terminal status.
6. Successful provisioning triggers a credentials notification email.
7. Failed provisioning triggers alerts and makes refund controls available.

## Security and reliability notes
- Use a DigitalOcean token with the minimum account scope possible.
- Execute `doctl` only on a trusted worker, never directly from the web request.
- Store generated passwords or initial secrets encrypted and expose them only through controlled notifications.
- Require idempotency keys for provisioning jobs so retries do not duplicate resources.
- Snapshot product pricing and configuration at order time to avoid drift.
- Store all money values as integers in the smallest currency unit.
- Add admin approval policies and multi-step confirmation for refunds.

## Suggested route map
### Storefront
- `/`
- `/catalog`
- `/products/{slug}`
- `/cart`
- `/checkout`
- `/orders`
- `/orders/{order}`

### Management
- `/management/login`
- `/management`
- `/management/payment-methods`
- `/management/products`
- `/management/orders`
- `/management/orders/{order}`
- `/management/provisioning-jobs`
- `/management/refunds`
- `/management/audit-logs`

## UI guidance
- Keep backgrounds bright with layered white translucency.
- Use soft blue accents, rounded corners, frosted panels, and comfortable spacing.
- Avoid dark mode as requested.
- Keep customer and admin UIs visually related but clearly separated through navigation and layout hierarchy.
