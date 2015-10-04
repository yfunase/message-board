class Message < ActiveRecord::Base
        # 名前は必須入力かつ20文字以内
    validates :name , length: {  maximum: 20 } , presence: true
    # 内容は必須入力かつ2文字以上30文字以下
    validates :body , length: {minimum: 2 , maximum: 30 } , presence: true
    # Age has to be integer and 1-3 letters
    validates :age , length: {minimum:1, maximum: 3}, presence: true , numericality: {only_integer: true }
end
