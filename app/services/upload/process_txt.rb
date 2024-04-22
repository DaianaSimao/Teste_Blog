module Upload
  class ProcessTxt 
    def initialize(file)
      @file = file.path
    end

    def execute
      txt_file_path = @file
      txt_file = File.open(txt_file_path, 'r')
      post = { titulo: "", body: "", tag_ids: ""}

      reading_body = false
      txt_file.each_line do |line|
        if line.start_with?("titulo:")
          post[:titulo] = line.sub("titulo:", "").strip
        elsif line.start_with?("tags:")
          post[:tag_ids] = line.sub("tags:", "").strip
        else
          if reading_body
            post[:body] += line
          else
            post[:body] = line
            reading_body = true
          end
        end
      end

      txt_file.close
      post[:tag_ids] = Tag.new.salvar_tags(post[:tag_ids])
      post
    end
  end
end
