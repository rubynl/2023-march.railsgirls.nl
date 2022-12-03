require "digest"

module ScriptHelper
  def csp_policy
    script_src =
      if Bridgetown.env.development?
        "'unsafe-inline'"
      else
        "'sha256-#{sha256_for plausible_script}' 'sha256-#{sha256_for plausible_404_script}'"
      end
    raw "default-src 'none'; script-src 'self' https://plausible.io #{script_src}; connect-src 'self' https://plausible.io; img-src 'self'; style-src 'self' 'unsafe-inline'; font-src 'self'; base-uri 'self'; form-action 'self'"
  end

  def plausible_domain
    env_domain = ENV.fetch("PLAUSIBLE_DOMAIN", "").strip
    if env_domain.empty?
      "railsgirls.nl"
    else
      env_domain
    end
  end

  def plausible_script
    "window.plausible = window.plausible || function() { (window.plausible.q = window.plausible.q || []).push(arguments) }"
  end

  def plausible_404_script
    %(plausible("404",{ props: { path: document.location.pathname } });)
  end

  def sha256_for(script)
    Digest::SHA256.base64digest(script)
  end
end

Bridgetown::RubyTemplateView::Helpers.include ScriptHelper
