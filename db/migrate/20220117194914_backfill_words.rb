class BackfillWords < ActiveRecord::Migration[6.0]
  def change
    Prompt.all.each do |prompt|
      Word.consume_prompt(prompt.prompt)
    end
  end
end
