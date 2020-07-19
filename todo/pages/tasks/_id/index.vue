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
      task: {}
    }
  },
  created() {
    this.fetchTask(this.$route.params.id)
  },
  methods: {
    async fetchTask(taskId) {
      const endpoint = `/api/v1/tasks/${taskId}`
      this.task = await this.$axios.$get(endpoint)
    }
  }
}
</script>
