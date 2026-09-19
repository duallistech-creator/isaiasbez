// ===== Mobile Menu Toggle =====
const navToggle = document.getElementById('nav-toggle');
const mobileMenu = document.getElementById('mobile-menu');

if (navToggle && mobileMenu) {
  navToggle.addEventListener('click', () => {
    mobileMenu.classList.toggle('open');
  });

  // Close mobile menu on link click
  mobileMenu.querySelectorAll('.nav-link, .btn').forEach(link => {
    link.addEventListener('click', () => {
      mobileMenu.classList.remove('open');
    });
  });
}

// ===== Smooth Scrolling (same-page anchors only) =====
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function(e) {
    const hash = this.getAttribute('href');
    if (hash.length < 2) return;
    const target = document.querySelector(hash);
    if (target) {
      e.preventDefault();
      const headerOffset = 100;
      const elementPosition = target.getBoundingClientRect().top;
      const offsetPosition = elementPosition + window.pageYOffset - headerOffset;
      window.scrollTo({ top: offsetPosition, behavior: 'smooth' });
    }
  });
});

// ===== Header Scroll Effect =====
const header = document.getElementById('header');
if (header) {
  window.addEventListener('scroll', () => {
    if (window.scrollY > 12) {
      header.classList.add('scrolled');
    } else {
      header.classList.remove('scrolled');
    }
  });
}

// ===== FAQ Accordion =====
document.querySelectorAll('.faq-q').forEach(btn => {
  btn.addEventListener('click', () => {
    const item = btn.closest('.faq-item');
    const wasOpen = item.classList.contains('open');

    // Close all
    document.querySelectorAll('.faq-item').forEach(i => i.classList.remove('open'));

    // Toggle current
    if (!wasOpen) item.classList.add('open');
  });
});

// ===== Scroll Animations =====
const animateElements = document.querySelectorAll('[data-animate]');
if (animateElements.length) {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate-in');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

  animateElements.forEach(el => observer.observe(el));
}
