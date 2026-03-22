<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nimbus MM - DigitalOcean Reseller Prototype</title>
    <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<div class="container">
    <nav class="navbar glass">
        <div class="nav-inner">
            <div class="brand">Nimbus MM<small>DigitalOcean Reseller Experience</small></div>
            <div class="nav-links">
                <a href="#catalog">Products</a>
                <a href="#workflow">Workflow</a>
                <a href="#checkout">Checkout</a>
                <a href="#architecture">Architecture</a>
                <a href="management/index.jsp">Management</a>
            </div>
            <div class="nav-actions">
                <a class="btn secondary" href="#checkout">Sign in / Register</a>
                <a class="btn primary" href="#catalog">Start order</a>
            </div>
        </div>
    </nav>

    <section class="hero">
        <div class="hero-copy">
            <div class="badge">Myanmar-friendly cloud commerce with manual payment verification</div>
            <h1>Sell DigitalOcean services with a calm, modern and reliable buying flow.</h1>
            <p>
                This prototype maps your requested Laravel + Vue 3 + Tailwind application: separated storefront and
                <strong>/management</strong> admin panel, glass-style UI, manual payment-slip verification, and resource provisioning
                through <strong>doctl</strong> only after payment approval.
            </p>
            <div class="nav-actions" style="margin-top: 22px;">
                <a class="btn primary" href="#workflow">See purchase flow</a>
                <a class="btn secondary" href="management/index.jsp">Open admin panel</a>
            </div>
        </div>
        <div class="hero-panel glass">
            <div class="metric-grid">
                <div class="metric">
                    <h3>Supported account access</h3>
                    <p>Email/password login plus Google OAuth for faster onboarding.</p>
                </div>
                <div class="metric">
                    <h3>Provisioning gate</h3>
                    <p>No DigitalOcean resource is created until an admin confirms uploaded payment proof.</p>
                </div>
                <div class="metric">
                    <h3>Payment methods</h3>
                    <p>KPay, Wave Money and any custom manual-transfer method created in admin.</p>
                </div>
                <div class="metric">
                    <h3>Delivery</h3>
                    <p>Provisioned service credentials and onboarding details are emailed to the customer.</p>
                </div>
            </div>
            <div class="metric">
                <h3>Reliability principles</h3>
                <p>Queued provisioning, command logs, operator audit trail, refund path, and inventory snapshots for repeatable service creation.</p>
            </div>
        </div>
    </section>

    <section class="section" id="catalog">
        <div class="section-title">
            <div>
                <h2>Product catalog preview</h2>
                <p>Each product maps to a configurable DigitalOcean template that the user can customize before adding to cart.</p>
            </div>
            <a class="btn secondary" href="#checkout">Go to checkout</a>
        </div>
        <div class="product-grid">
            <article class="card glass">
                <div class="badge">VPS / Droplets</div>
                <h3>Basic compute</h3>
                <div class="price">From $8 / mo</div>
                <p>Choose region, CPU/RAM plan, storage profile, SSH key option, backups and project tag.</p>
                <ul>
                    <li>Preset sizes synced from DigitalOcean pricing metadata</li>
                    <li>Customer chooses image, region and hostname</li>
                    <li>Provisioned via queued <code>doctl compute droplet create</code></li>
                </ul>
            </article>
            <article class="card glass">
                <div class="badge">Managed databases</div>
                <h3>PostgreSQL / MySQL / Redis</h3>
                <div class="price">From $15 / mo</div>
                <p>Pick engine, node size, storage class, region, high availability and maintenance preferences.</p>
                <ul>
                    <li>Engine-specific validation rules</li>
                    <li>Connection credentials emailed after provisioning</li>
                    <li>Error state can trigger refund workflow</li>
                </ul>
            </article>
            <article class="card glass">
                <div class="badge">Future extensions</div>
                <h3>Kubernetes, Spaces, add-ons</h3>
                <div class="price">Config-driven</div>
                <p>Add new sellable products from admin by defining variable fields, templates and provisioning commands.</p>
                <ul>
                    <li>Catalog is admin-managed and can be enabled/disabled</li>
                    <li>Margin rules can be flat, percentage or tier-based</li>
                    <li>Prepared for coupons and service bundles</li>
                </ul>
            </article>
        </div>
    </section>

    <section class="section" id="workflow">
        <div class="section-title">
            <div>
                <h2>Customer purchase workflow</h2>
                <p>The creation lifecycle is intentionally conservative so you never allocate billable cloud resources before a payment is truly approved.</p>
            </div>
        </div>
        <div class="flow-grid">
            <div class="flow-step glass"><span>1</span><h3>Register</h3><p>User signs up with email or Google, verifies email and lands on the storefront dashboard.</p></div>
            <div class="flow-step glass"><span>2</span><h3>Configure</h3><p>User chooses product options, sees localized pricing, and builds a cart with multiple services.</p></div>
            <div class="flow-step glass"><span>3</span><h3>Pay manually</h3><p>User picks KPay/WaveMoney/manual bank transfer, uploads payment slip, and enters the last 6 transaction digits.</p></div>
            <div class="flow-step glass"><span>4</span><h3>Approve & provision</h3><p>Admin reviews the proof, approves, then a queued job runs doctl and emails resulting credentials to the customer.</p></div>
        </div>
    </section>

    <section class="section" id="checkout">
        <div class="section-title">
            <div>
                <h2>Checkout interaction</h2>
                <p>This demonstrates the data your Laravel/Vue checkout should capture before the order becomes a pending payment review.</p>
            </div>
        </div>
        <div class="checkout-grid">
            <div class="checkout-form glass">
                <h3>Customer checkout</h3>
                <div class="form-grid">
                    <div class="field"><label>Service type</label><select><option>Basic Droplet</option><option>Managed PostgreSQL</option></select></div>
                    <div class="field"><label>Region</label><select><option>Singapore</option><option>Bangalore</option><option>Frankfurt</option></select></div>
                    <div class="field"><label>CPU / RAM</label><select><option>1 vCPU / 2 GB</option><option>2 vCPU / 4 GB</option><option>4 vCPU / 8 GB</option></select></div>
                    <div class="field"><label>Operating system</label><select><option>Ubuntu 24.04</option><option>Debian 12</option><option>Docker image</option></select></div>
                    <div class="field"><label>Payment option</label><select><option>KPay</option><option>Wave Money</option><option>Bank transfer</option></select></div>
                    <div class="field"><label>Last 6 transaction digits</label><input value="482913" /></div>
                    <div class="field"><label>Primary email</label><input value="buyer@example.com" /></div>
                    <div class="field"><label>Google-linked account</label><input value="Optional - auto-filled if social login used" /></div>
                </div>
                <div class="field" style="margin-top:16px;"><label>Provisioning notes / hostname requests</label><textarea>hostname: team-app-01
ssh public key fingerprint: optional
notes: enable backups and add monitoring tags</textarea></div>
                <div class="nav-actions" style="margin-top:16px;">
                    <button class="btn primary">Submit order for review</button>
                    <button class="btn secondary">Save draft cart</button>
                </div>
                <p class="note" style="margin-top: 14px;">In the real Laravel build, the payment slip is stored privately, virus-scanned, and linked to a payment review record instead of provisioning immediately.</p>
            </div>
            <aside class="order-summary glass">
                <h3>Order summary</h3>
                <div class="table-like">
                    <div class="table-row">
                        <div><strong>Droplet / 2 vCPU 4 GB</strong><p>Singapore • Ubuntu 24.04 • Backups</p></div>
                        <div>$24.00</div><div>Qty 1</div><div>Ready</div>
                    </div>
                    <div class="table-row">
                        <div><strong>Managed PostgreSQL</strong><p>1 node • 1 GB RAM • daily backups</p></div>
                        <div>$18.00</div><div>Qty 1</div><div>Ready</div>
                    </div>
                </div>
                <div class="metric" style="margin-top:18px;">
                    <h3>What happens next</h3>
                    <p>Order status becomes <strong>awaiting_payment_review</strong>. Admins can approve, reject, request clarification, or refund if provisioning later fails.</p>
                </div>
            </aside>
        </div>
    </section>

    <section class="section" id="architecture">
        <div class="section-title">
            <div>
                <h2>Recommended Laravel architecture</h2>
                <p>Use a shared backend with two experiences: the customer storefront and a protected management area under <strong>/management</strong>.</p>
            </div>
        </div>
        <div class="section-grid">
            <div class="spec-block glass">
                <h3>Storefront domain</h3>
                <ul>
                    <li>Vue 3 + Tailwind SPA or Inertia pages for catalog, cart, checkout and order history.</li>
                    <li>Laravel Socialite for Google login, native auth for email registration, and email verification.</li>
                    <li>Product configurator fed by admin-defined schemas and DigitalOcean plan snapshots.</li>
                    <li>Order pipeline states: draft → pending_payment → under_review → approved → provisioning → active / failed / refunded.</li>
                </ul>
            </div>
            <div class="spec-block glass">
                <h3>Management domain</h3>
                <ul>
                    <li>Separate route group under <code>/management</code> with admin authentication and authorization policies.</li>
                    <li>Payment option CRUD, catalog/product templates, pricing rules, and operational logs.</li>
                    <li>Payment review queue with slip image preview, transaction suffix matching and manual approve/reject actions.</li>
                    <li>Refund center, provisioning retries, and doctl command output history for support visibility.</li>
                </ul>
            </div>
        </div>
    </section>

    <footer class="footer">
        Designed as a bright, glassmorphism prototype for the Laravel + Vue 3 reseller platform you described.
    </footer>
</div>
</body>
</html>
