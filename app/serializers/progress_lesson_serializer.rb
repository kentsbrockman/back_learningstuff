class ProgressLessonSerializer < ActiveModel::Serializer
  attributes :id, :quizz_result
  belongs_to :progress_state
  belongs_to :lesson
  has_one :user
end
