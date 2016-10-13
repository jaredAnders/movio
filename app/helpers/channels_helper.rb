module ChannelsHelper
  def admin_button
    if current_user && current_user == @channel.user
      link_to 'Admin View', contributor_channel_path(@channel), class: 'btn-flat waves-light waves-effect right red-text'
    end
  end
end
