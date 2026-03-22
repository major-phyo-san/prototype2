# Nimbus MM reseller prototype

This repository now contains a polished prototype and implementation blueprint for a **DigitalOcean reseller platform** with the product direction you requested:

- **Customer storefront** for registration, product discovery, configuration, cart and checkout.
- **Admin management area** under `/management` for payment method setup, manual payment verification, provisioning oversight and refunds.
- **Provisioning guardrail** so DigitalOcean resources are created only after an admin confirms a manual payment submission.
- **Bright glassmorphism UI direction** intended for the future Laravel + Vue 3 + Tailwind implementation.

## Prototype pages
- Storefront: `src/main/webapp/index.jsp`
- Admin panel: `src/main/webapp/management/index.jsp`

## Build blueprint
- Architecture notes: `docs/laravel-vue-reseller-blueprint.md`

## Next recommended step
Initialize a fresh Laravel + Vue 3 application in this repository (or a sibling repo), then port the domain model and UI structure from the blueprint into production code.
