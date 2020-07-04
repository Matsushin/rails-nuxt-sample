<template>
  <div class="new-task-container">
    <h2 class="mb-3">
      タスク新規登録
    </h2>
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
  computed: {
    ...mapGetters({
      currentUser: 'auth/currentUser',
      survey: 'tasks/task'
    })
  },
  asyncData() {
    return {
      formData: {},
      errors: []
    }
  },
  methods: {
    async handleSubmit() {
      const params = {
        task: {
          title: this.formData.title || '',
          body: this.formData.body || ''
        }
      }
      await this.createtask(params)
    },
    async createtask(params) {
      const endpoint = '/api/v1/tasks'
      const res = await this.$axios.$post(endpoint, params)

      if (res.errors) {
        this.errors = res.errors
      } else {
        this.$router.push('/tasks')
        this.$toast.info('タスクを新規登録しました。')
      }
    }
  }
}
</script>
