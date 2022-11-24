require "digest"

module PageMetadata
  def site_title
    site.metadata.title
  end

  def page_title
    resource = view.resource
    full_title = resource.data.full_title
    title = resource.data.title
    if full_title
      full_title
    elsif title
      "#{title} | #{site_title}"
    else
      site_title
    end
  end

  def canonical_url_for(resource)
    return unless resource.destination

    resource.destination.absolute_url
  end

  def canonical_url
    canonical_url_for(view.resource)
  end

  def page_meta_description
    if view.resource.data.description
      view.resource.data.description
    else
      site.metadata.description
    end
  end

  def image_path(path)
    file_checksum = Digest::MD5.file(File.join("src", path))
    relative_url "/#{path}?#{file_checksum}"
  end

  def apple_touch_icon_path
    absolute_url image_path("images/apple-touch-icon.png")
  end

  def default_social_image_url
    absolute_url image_path("images/social-media.png")
  end

  def twitter_card_type
    "summary"
  end

  def sha256_for(script)
    Digest::SHA256.base64digest(script)
  end
end

Bridgetown::RubyTemplateView::Helpers.include PageMetadata
