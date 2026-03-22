<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nimbus MM Management</title>
    <link rel="stylesheet" href="../assets/styles.css" />
</head>
<body>
<div class="container">
    <nav class="navbar glass">
        <div class="nav-inner">
            <div class="brand">Nimbus MM<small>/management admin prototype</small></div>
            <div class="nav-links">
                <a href="../index.jsp">Storefront</a>
                <a href="#payments">Payments</a>
                <a href="#products">Products</a>
                <a href="#provisioning">Provisioning</a>
            </div>
            <div class="nav-actions">
                <a class="btn secondary" href="../index.jsp">View commerce</a>
                <a class="btn primary" href="#payments">Review queue</a>
            </div>
        </div>
    </nav>

    <section class="section">
        <div class="section-title">
            <div>
                <h2>Operations dashboard</h2>
                <p>Admin actions are isolated under <strong>/management</strong> and cover payment verification, catalog management, provisioning and refunds.</p>
            </div>
        </div>
        <div class="kpis">
            <div class="kpi glass"><div>Pending payment reviews</div><strong>18</strong><div class="note">Need manual approval before provisioning</div></div>
            <div class="kpi glass"><div>Provisioning jobs active</div><strong>4</strong><div class="note">Queued workers calling doctl with audit logs</div></div>
            <div class="kpi glass"><div>Refund cases open</div><strong>2</strong><div class="note">Awaiting finance action after failed provisioning</div></div>
        </div>
    </section>

    <section class="section admin-grid" id="payments">
        <div class="admin-shell glass">
            <h3>Payment verification queue</h3>
            <div class="table-like">
                <div class="table-row"><div><strong>#ORD-24031 • buyer@example.com</strong><p>KPay • txn suffix 482913 • Basic Droplet</p></div><div>$24.00</div><div>Slip uploaded</div><div><button class="btn success">Approve</button></div></div>
                <div class="table-row"><div><strong>#ORD-24032 • org@example.com</strong><p>Wave Money • txn suffix 104278 • Managed PostgreSQL</p></div><div>$18.00</div><div>Need review</div><div><button class="btn warning">Request info</button></div></div>
                <div class="table-row"><div><strong>#ORD-24033 • startup@example.com</strong><p>Bank transfer • txn suffix 882144 • Redis</p></div><div>$15.00</div><div>Mismatch found</div><div><button class="btn secondary">Reject</button></div></div>
            </div>
        </div>
        <div class="admin-shell glass">
            <h3>Approval safeguards</h3>
            <ul>
                <li>Only approved payments dispatch provisioning jobs.</li>
                <li>Every status change is audit-logged with actor and timestamp.</li>
                <li>Slip files are stored privately and downloadable by authorized admins only.</li>
                <li>Refunds are available when provisioning ends in a terminal failure.</li>
            </ul>
        </div>
    </section>

    <section class="section admin-grid" id="products">
        <div class="admin-shell glass">
            <h3>Catalog & payment option controls</h3>
            <div class="table-like">
                <div class="table-row"><div><strong>KPay</strong><p>Manual instructions, account name and QR image configurable</p></div><div>Enabled</div><div>3.5% fee</div><div>Edit</div></div>
                <div class="table-row"><div><strong>Wave Money</strong><p>Supports payment slip upload and transaction suffix entry</p></div><div>Enabled</div><div>2.9% fee</div><div>Edit</div></div>
                <div class="table-row"><div><strong>Basic Droplet</strong><p>CPU, RAM, region and image variations controlled by schema</p></div><div>Live</div><div>12% margin</div><div>Edit</div></div>
            </div>
        </div>
        <div class="admin-shell glass" id="provisioning">
            <h3>Provisioning strategy</h3>
            <p class="note">Recommended Laravel job flow:</p>
            <ul>
                <li>Persist a provisioning request snapshot from the approved order.</li>
                <li>Queue a job that executes doctl via a dedicated service account token.</li>
                <li>Capture stdout/stderr, store resulting resource identifiers, and send credential email.</li>
                <li>If creation fails, mark order failed, alert admin, and expose refund action.</li>
            </ul>
        </div>
    </section>
</div>
</body>
</html>
