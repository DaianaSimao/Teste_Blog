class ProcessPostJob < ApplicationJob
  queue_as :default

  def perform(*args)
    post = Post.new(titulo: args[0], body: args[1], tag_ids: args[2], user_id: args[3])
    post.save
  end
end
