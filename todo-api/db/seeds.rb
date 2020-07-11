if Task.all.count.zero?
  Task.transaction do
    5.times do |index|
      Task.create(title: "タスクタイトル#{index + 1}", body: 'ここにタスクの詳細内容が入ります。')
    end
  end
end