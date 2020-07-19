<template>
  <div class="show-task-container">
    <h2 class="mb-3">
      タスク詳細
    </h2>
    <a type="primary" nuxt href="/tasks">
      タスク一覧へ戻る
    </a>
    <v-card class="mx-auto mt-2">
      <v-card-text>
        <div>作成日時：{{ ymdhms(task.created_at) }}</div>
        <div>更新日時：{{ ymdhms(task.updated_at) }}</div>
        <p class="display-1 text--primary mt-1">
          {{ task.title }}
        </p>
        <div v-html="nl2br(task.body)" class="text--primary" />
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
export default {
  data() {
    return {
      task: {
        title: 'タスクタイトル1',
        body: 'タスク内容がここに入ります。',
        created_at: '2020-07-01 10:00:00',
        updated_at: '2020-07-01 10:00:00'
      }
    }
  }
}
</script>
