<template>
  <div class="edit-task-container">
    <h2>タスク編集</h2>
    <a type="primary" nuxt href="/tasks">
      タスク一覧へ戻る
    </a>
    <Errors :errors="errors" />
    <v-form ref="form">
      <div class="box-wrapper">
        <div class="box">
          <div class="panel panel-input-list">
            <v-text-field
              v-model="formData.title"
              :counter="20"
              label="タイトル"
              placeholder="ここにタスクのタイトルが入ります"
              required />
            <v-textarea
              v-model="formData.body"
              label="本文"
              placeholder="ここにタスク内容が入ります" />
          </div>
        </div>
      </div>

      <div class="mt-8">
        <v-btn @click="handleSubmit" color="primary">
          この内容で登録する
        </v-btn>
      </div>
    </v-form>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Errors from '@/components/shared/Errors'

export default {
  components: {
    Errors
  },
  data() {
    return {
      formData: {},
      errors: []
    }
  },
  computed: {
    ...mapGetters({
      task: 'tasks/task'
    })
  },
  async fetch({ store, params, redirect }) {
    await store.dispatch('tasks/fetchTask', params.id)
  },
  created() {
    this.formData = { ...this.task }
  },
  methods: {
    async handleSubmit() {
      const params = {
        task: {
          title: this.formData.title || '',
          body: this.formData.body || ''
        }
      }
      await this.updateTask(this.task, params)
    },
    async updateTask(task, params) {
      const endpoint = `/api/v1/tasks/${task.id}`
      const res = await this.$axios.$patch(endpoint, params)

      if (res.errors) {
        this.errors = res.errors
      } else {
        this.$store.dispatch('tasks/fetchTask', task.id)
        this.$router.push('/tasks')
        this.$toast.info('タスクを変更しました。')
      }
    }
  }
}
</script>
