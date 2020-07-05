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
        <div>作成日時：{{ formattedDate(task.created_at) }}</div>
        <div>更新日時：{{ formattedDate(task.updated_at) }}</div>
        <p class="display-1 text--primary mt-1">
          {{ task.title }}
        </p>
        <div v-html="task.body.replace(/\n/g, '<br/>')" class="text--primary" />
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  computed: {
    ...mapGetters({
      task: 'tasks/task'
    })
  },
  async fetch({ store, params }) {
    await store.dispatch('tasks/fetchTask', params.id)
  },
  methods: {
    formattedDate(str) {
      if (!str) {
        return
      }
      return this.$moment(str).format('YYYY年MM月DD日HH:mm:ss')
    }
  }
}
</script>
