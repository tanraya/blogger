module ApplicationHelper
  # Display Post image
  def post_image(post, force_reload = false)
    if post.image? && force_reload == false
      uri = post.image_url(:thumb)
      proc_class = ''
    else
      uri = "post_default.png"
      proc_class = 'processing'
    end

    image_tag uri, class: "post-image #{proc_class}", data: { lookup_uri: image_post_path(post) }
  end
end
