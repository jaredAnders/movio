module ChannelsHelper
  def admin_button
    if current_user && current_user == current_channel.user
      link_to 'Admin', contributor_channel_path(current_channel), class: 'btn-flat waves-light waves-effect right red-text'
    end
  end
end
