class Tweet < ActiveRecord::Base
    validates_presence_of :content, presence: true, message: "ツイートは1文字以上入力してください。"
    validates_length_of :content, maximum: 140, message: "ツイートは140文字以内にしてください。"
end
