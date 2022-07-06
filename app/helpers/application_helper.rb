module ApplicationHelper
  def is_admin?
    current_user && current_user.admin?
  end

  def avatar
    if current_user.avatar.present?
      image_tag current_user.avatar.variant(:thumb), class: 'header_avatar rounded-full inline'
    else
      image_tag 'default_avatar.jpg', class: 'header_avatar header_default_avatar rounded-full inline'
    end
  end

  def avatar_link
    link_to profile_index_path, class: 'user_profile_link' do
      avatar
    end
  end
end
