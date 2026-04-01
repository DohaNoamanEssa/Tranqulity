<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tranquility – Flutter App</title>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600&family=DM+Mono:wght@300;400&family=Syne:wght@400;700;800&display=swap" rel="stylesheet">
<style>
  :root {
    --bg: #0a0f0d;
    --surface: #111a15;
    --surface2: #162019;
    --accent: #7dbb8e;
    --accent2: #a8d5b5;
    --gold: #c9a96e;
    --text: #e8f0ea;
    --muted: #6b8c73;
    --border: rgba(125,187,142,0.15);
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }

  html { scroll-behavior: smooth; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: 'DM Mono', monospace;
    font-weight: 300;
    overflow-x: hidden;
    line-height: 1.7;
  }

  /* Noise overlay */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
    pointer-events: none;
    z-index: 0;
    opacity: 0.5;
  }

  /* Hero */
  .hero {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
    padding: 4rem 2rem;
    text-align: center;
    overflow: hidden;
  }

  .hero-glow {
    position: absolute;
    width: 600px;
    height: 600px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(125,187,142,0.08) 0%, transparent 70%);
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    pointer-events: none;
    animation: pulse 6s ease-in-out infinite;
  }

  @keyframes pulse {
    0%, 100% { transform: translate(-50%, -50%) scale(1); opacity: 0.6; }
    50% { transform: translate(-50%, -50%) scale(1.15); opacity: 1; }
  }

  .leaf-icon {
    font-size: 2.5rem;
    margin-bottom: 1.5rem;
    display: inline-block;
    animation: float 4s ease-in-out infinite;
    filter: drop-shadow(0 0 20px rgba(125,187,142,0.4));
  }

  @keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
  }

  .hero-title {
    font-family: 'Cormorant Garamond', serif;
    font-size: clamp(4rem, 10vw, 8rem);
    font-weight: 300;
    letter-spacing: 0.15em;
    color: var(--text);
    line-height: 1;
    position: relative;
    z-index: 1;
  }

  .hero-title span {
    color: var(--accent);
  }

  .hero-sub {
    font-family: 'DM Mono', monospace;
    font-size: 0.7rem;
    letter-spacing: 0.3em;
    color: var(--muted);
    text-transform: uppercase;
    margin-top: 1rem;
    position: relative;
    z-index: 1;
  }

  .hero-desc {
    max-width: 560px;
    font-size: 0.85rem;
    color: var(--muted);
    margin-top: 2rem;
    line-height: 1.9;
    position: relative;
    z-index: 1;
  }

  .hero-btns {
    display: flex;
    gap: 1rem;
    margin-top: 2.5rem;
    flex-wrap: wrap;
    justify-content: center;
    position: relative;
    z-index: 1;
  }

  .btn {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.75rem 1.75rem;
    font-family: 'DM Mono', monospace;
    font-size: 0.7rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    text-decoration: none;
    border-radius: 2px;
    transition: all 0.3s ease;
  }

  .btn-primary {
    background: var(--accent);
    color: var(--bg);
    font-weight: 400;
  }

  .btn-primary:hover {
    background: var(--accent2);
    transform: translateY(-2px);
    box-shadow: 0 8px 30px rgba(125,187,142,0.25);
  }

  .btn-secondary {
    border: 1px solid var(--border);
    color: var(--accent);
    background: transparent;
  }

  .btn-secondary:hover {
    border-color: var(--accent);
    background: rgba(125,187,142,0.05);
    transform: translateY(-2px);
  }

  .btn-gold {
    background: transparent;
    border: 1px solid rgba(201,169,110,0.3);
    color: var(--gold);
  }

  .btn-gold:hover {
    border-color: var(--gold);
    background: rgba(201,169,110,0.05);
    transform: translateY(-2px);
  }

  /* Divider */
  .divider {
    width: 100%;
    height: 1px;
    background: var(--border);
    position: relative;
    overflow: visible;
  }

  .divider::after {
    content: '◆';
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    background: var(--bg);
    padding: 0 1rem;
    color: var(--accent);
    font-size: 0.5rem;
  }

  /* Section */
  .section {
    max-width: 1000px;
    margin: 0 auto;
    padding: 5rem 2rem;
    position: relative;
    z-index: 1;
  }

  .section-label {
    font-size: 0.65rem;
    letter-spacing: 0.35em;
    text-transform: uppercase;
    color: var(--accent);
    margin-bottom: 0.75rem;
  }

  .section-title {
    font-family: 'Cormorant Garamond', serif;
    font-size: clamp(2rem, 5vw, 3.5rem);
    font-weight: 300;
    color: var(--text);
    margin-bottom: 3rem;
    line-height: 1.1;
  }

  /* Features Grid */
  .features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
    gap: 1px;
    background: var(--border);
    border: 1px solid var(--border);
  }

  .feature-card {
    background: var(--surface);
    padding: 2rem 1.5rem;
    transition: background 0.3s;
    cursor: default;
  }

  .feature-card:hover {
    background: var(--surface2);
  }

  .feature-icon {
    font-size: 1.4rem;
    margin-bottom: 0.75rem;
    display: block;
  }

  .feature-name {
    font-family: 'Syne', sans-serif;
    font-size: 0.85rem;
    font-weight: 700;
    color: var(--text);
    margin-bottom: 0.4rem;
    letter-spacing: 0.05em;
  }

  .feature-desc {
    font-size: 0.72rem;
    color: var(--muted);
    line-height: 1.6;
  }

  /* Screenshots */
  .screenshots-scroll {
    display: flex;
    gap: 1rem;
    overflow-x: auto;
    padding-bottom: 1rem;
    scrollbar-width: thin;
    scrollbar-color: var(--accent) var(--surface);
  }

  .screenshots-scroll::-webkit-scrollbar {
    height: 3px;
  }

  .screenshots-scroll::-webkit-scrollbar-track {
    background: var(--surface);
  }

  .screenshots-scroll::-webkit-scrollbar-thumb {
    background: var(--accent);
  }

  .screenshot-frame {
    flex-shrink: 0;
    width: 140px;
    height: 280px;
    border: 1px solid var(--border);
    border-radius: 12px;
    overflow: hidden;
    background: var(--surface);
    position: relative;
    transition: transform 0.3s, box-shadow 0.3s;
  }

  .screenshot-frame:hover {
    transform: translateY(-6px) scale(1.03);
    box-shadow: 0 20px 50px rgba(0,0,0,0.5), 0 0 30px rgba(125,187,142,0.1);
  }

  .screenshot-frame img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
  }

  .screenshot-frame .num {
    position: absolute;
    bottom: 0.5rem;
    right: 0.5rem;
    background: rgba(0,0,0,0.6);
    color: var(--accent);
    font-size: 0.6rem;
    padding: 0.2rem 0.5rem;
    border-radius: 2px;
    letter-spacing: 0.1em;
  }

  /* Tech stack */
  .tech-pills {
    display: flex;
    flex-wrap: wrap;
    gap: 0.75rem;
    margin-top: 1rem;
  }

  .pill {
    border: 1px solid var(--border);
    padding: 0.5rem 1.25rem;
    font-size: 0.7rem;
    letter-spacing: 0.15em;
    text-transform: uppercase;
    color: var(--accent);
    border-radius: 2px;
    transition: all 0.2s;
    cursor: default;
  }

  .pill:hover {
    border-color: var(--accent);
    background: rgba(125,187,142,0.06);
  }

  /* Architecture */
  .arch-block {
    background: var(--surface);
    border: 1px solid var(--border);
    padding: 2rem;
    border-radius: 2px;
    font-family: 'DM Mono', monospace;
    font-size: 0.75rem;
    line-height: 1.8;
    color: var(--muted);
    overflow-x: auto;
  }

  .arch-block .dir { color: var(--accent2); }
  .arch-block .sub { color: var(--muted); }
  .arch-block .file { color: var(--gold); }
  .arch-block .root { color: var(--accent); font-weight: 400; }

  /* Developer card */
  .dev-card {
    display: flex;
    align-items: center;
    gap: 2rem;
    background: var(--surface);
    border: 1px solid var(--border);
    padding: 2.5rem;
    position: relative;
    overflow: hidden;
  }

  .dev-card::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background: linear-gradient(to bottom, var(--accent), var(--gold));
  }

  .dev-avatar {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--accent), var(--gold));
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Cormorant Garamond', serif;
    font-size: 1.8rem;
    color: var(--bg);
    font-weight: 600;
    flex-shrink: 0;
  }

  .dev-name {
    font-family: 'Cormorant Garamond', serif;
    font-size: 1.8rem;
    font-weight: 300;
    color: var(--text);
    margin-bottom: 0.3rem;
  }

  .dev-role {
    font-size: 0.7rem;
    letter-spacing: 0.2em;
    text-transform: uppercase;
    color: var(--muted);
  }

  /* Footer */
  footer {
    border-top: 1px solid var(--border);
    text-align: center;
    padding: 3rem 2rem;
    font-size: 0.65rem;
    letter-spacing: 0.2em;
    color: var(--muted);
    text-transform: uppercase;
    position: relative;
    z-index: 1;
  }

  /* Fade in animation */
  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
  }

  .fade-up {
    animation: fadeUp 0.8s ease forwards;
    opacity: 0;
  }

  .fade-up:nth-child(1) { animation-delay: 0.1s; }
  .fade-up:nth-child(2) { animation-delay: 0.2s; }
  .fade-up:nth-child(3) { animation-delay: 0.3s; }
  .fade-up:nth-child(4) { animation-delay: 0.4s; }
  .fade-up:nth-child(5) { animation-delay: 0.5s; }

  @media (max-width: 600px) {
    .dev-card { flex-direction: column; text-align: center; }
    .dev-card::before { left: 0; top: 0; right: 0; bottom: auto; width: 100%; height: 3px; }
    .hero-btns { flex-direction: column; align-items: center; }
  }
</style>
</head>
<body>

<!-- HERO -->
<section class="hero">
  <div class="hero-glow"></div>
  <div class="leaf-icon fade-up">🌿</div>
  <h1 class="hero-title fade-up">Tranqu<span>i</span>lity</h1>
  <p class="hero-sub fade-up">Flutter Mobile Application · Clean Architecture</p>
  <p class="hero-desc fade-up">
    A modern, scalable mobile application featuring real-time chat, user profile management, and seamless REST API integration — built with precision and care.
  </p>
  <div class="hero-btns fade-up">
    <a href="https://drive.google.com/file/d/1feY1FBANrhQh76BZaQxA2NdiX7uADvJ9/view?usp=drive_link" class="btn btn-primary" target="_blank">⬇ Download APK</a>
    <a href="https://youtube.com/shorts/WdjZ3iGokl8?si=QjPc50-RA_QsGftt" class="btn btn-gold" target="_blank">▶ Watch Demo</a>
  </div>
</section>

<div class="divider"></div>

<!-- FEATURES -->
<div class="section">
  <p class="section-label">What's inside</p>
  <h2 class="section-title">Features</h2>

  <div class="features-grid">
    <div class="feature-card">
      <span class="feature-icon">🔐</span>
      <div class="feature-name">Authentication</div>
      <div class="feature-desc">Secure login and register flows with full error handling.</div>
    </div>
    <div class="feature-card">
      <span class="feature-icon">💬</span>
      <div class="feature-name">Real-time Chat</div>
      <div class="feature-desc">Live messaging system with smooth UX and state management.</div>
    </div>
    <div class="feature-card">
      <span class="feature-icon">👤</span>
      <div class="feature-name">User Profile</div>
      <div class="feature-desc">View and edit profile information with seamless updates.</div>
    </div>
    <div class="feature-card">
      <span class="feature-icon">🌍</span>
      <div class="feature-name">REST API</div>
      <div class="feature-desc">Full integration via Dio with clean data layer separation.</div>
    </div>
    <div class="feature-card">
      <span class="feature-icon">⚡</span>
      <div class="feature-name">Error Handling</div>
      <div class="feature-desc">Graceful error and loading states throughout the app.</div>
    </div>
    <div class="feature-card">
      <span class="feature-icon">📐</span>
      <div class="feature-name">Responsive UI</div>
      <div class="feature-desc">ScreenUtil-powered layout that adapts to any screen size.</div>
    </div>
    <div class="feature-card">
      <span class="feature-icon">🧩</span>
      <div class="feature-name">Custom Widgets</div>
      <div class="feature-desc">Reusable component library for consistent, maintainable UI.</div>
    </div>
  </div>
</div>

<div class="divider"></div>

<!-- SCREENSHOTS -->
<div class="section">
  <p class="section-label">Visual preview</p>
  <h2 class="section-title">Screenshots</h2>

  <div class="screenshots-scroll">
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/d7eb92ae-f421-4aca-87c3-2fcde3d9c226" alt="Screen 1" loading="lazy">
      <span class="num">01</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/bf6a6eff-bbcf-4628-b4b1-d81d0ef38224" alt="Screen 2" loading="lazy">
      <span class="num">02</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/d100764e-b9bc-4015-82eb-053093bb6336" alt="Screen 3" loading="lazy">
      <span class="num">03</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/d3283971-06ff-413b-aff6-add1ae5d02e8" alt="Screen 4" loading="lazy">
      <span class="num">04</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/36f44d85-a816-4615-91fc-6df55ac055f5" alt="Screen 5" loading="lazy">
      <span class="num">05</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/4a2284a0-218c-4995-910a-86103d08e05f" alt="Screen 6" loading="lazy">
      <span class="num">06</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/bcc41fa1-4a6e-43d2-920d-7c8868879cad" alt="Screen 7" loading="lazy">
      <span class="num">07</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/7b001885-6eeb-4913-a7b5-378ac3662a3a" alt="Screen 8" loading="lazy">
      <span class="num">08</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/9abcaaf9-1f24-4baf-9de9-625cfba6f5b9" alt="Screen 9" loading="lazy">
      <span class="num">09</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/812bcf43-e465-4b55-983a-e90abec6b7e3" alt="Screen 10" loading="lazy">
      <span class="num">10</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/c33d4cbe-ddeb-490b-8e63-e7ec6ce505b9" alt="Screen 11" loading="lazy">
      <span class="num">11</span>
    </div>
    <div class="screenshot-frame">
      <img src="https://github.com/user-attachments/assets/51596aca-0b80-40c8-8ba2-a97ad90b4594" alt="Screen 12" loading="lazy">
      <span class="num">12</span>
    </div>
  </div>
</div>

<div class="divider"></div>

<!-- TECH STACK -->
<div class="section">
  <p class="section-label">Built with</p>
  <h2 class="section-title">Tech Stack</h2>
  <div class="tech-pills">
    <span class="pill">Flutter</span>
    <span class="pill">Dart</span>
    <span class="pill">Dio</span>
    <span class="pill">RESTful API</span>
    <span class="pill">ScreenUtil</span>
    <span class="pill">Clean Architecture</span>
  </div>
</div>

<div class="divider"></div>

<!-- ARCHITECTURE -->
<div class="section">
  <p class="section-label">Structure</p>
  <h2 class="section-title">Architecture</h2>
  <div class="arch-block">
<span class="root">lib/</span>
│
├── <span class="dir">core/</span>
│   ├── <span class="sub">logic/</span>
│   ├── <span class="sub">ui/</span>
│   └── <span class="sub">services/</span>
│
├── <span class="dir">features/</span>
│   ├── <span class="sub">auth/</span>
│   ├── <span class="sub">chat/</span>
│   └── <span class="sub">profile/</span>
│
├── <span class="dir">models/</span>
│
└── <span class="file">main.dart</span>
  </div>
</div>

<div class="divider"></div>

<!-- DEVELOPER -->
<div class="section">
  <p class="section-label">Behind the code</p>
  <h2 class="section-title">Developer</h2>
  <div class="dev-card">
    <div class="dev-avatar">D</div>
    <div>
      <div class="dev-name">Doha Noaman</div>
      <div class="dev-role">Mobile Application Developer · Flutter Developer</div>
    </div>
  </div>
</div>

<footer>
  <span>🌿 Tranquility &nbsp;·&nbsp; Flutter Mobile App &nbsp;·&nbsp; Clean Architecture</span>
</footer>

</body>
</html>
