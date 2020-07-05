<template>
  <div class="task-table">
    <Errors :errors="errors" />
    <v-data-table
      :headers="headers"
      :items="tasks"
      item-key="id"
      loading-text="読込中"
      no-data-text="データがありません。">
      <template v-slot:item.created_at="{ item }">
        {{ formattedDate(item.created_at) }}
      </template>
      <template v-slot:item.actions="{ item }">
        <v-btn
          :to="`/tasks/${item.id}`"
          class="ma-2"
          color="success"
          nuxt
          dark>
          詳細
        </v-btn>
        <v-btn
          @click="edit(item.id)"
          class="ma-2"
          color="primary"
          dark>
          編集
          <v-icon dark right>
            mdi-pencil
          </v-icon>
        </v-btn>
        <v-btn
          @click="handleDeleteTask(item.id)"
          class="ma-2"
          color="red"
          dark>
          削除
          <v-icon dark right>
            mdi-delete
          </v-icon>
        </v-btn>
      </template>
    </v-data-table>
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
      errors: [],
      headers: [
        {
          text: 'タイトル',
          align: 'start',
          value: 'title'
        },
        { text: '内容', value: 'body' },
        { text: '作成日時', value: 'created_at' },
        { text: '操作', sortable: false, value: 'actions' }
      ]
    }
  },
  computed: {
    ...mapGetters({
      tasks: 'tasks/tasks',
    })
  },
  created() {
    this.fetchTasks()
  },
  methods: {
    tableRowClassName({ row, _rowIndex }) {
      if (row.completed_at) {
        return 'success-row'
      }
      return ''
    },
    formattedDate(str) {
      if (!str) {
        return
      }
      return this.$moment(str).format('YYYY年MM月DD日HH:mm:ss')
    },
    edit(id) {
      this.$router.push({
        name: 'tasks-id-edit',
        params: {
          id: id
        }
      })
    },
    handleDeleteTask(id) {
      if (confirm('タスクを削除しますか？')) {
        this.deleteTask(id)
      }
    },
    async fetchTasks() {
      await this.$store.dispatch('tasks/fetchTasks')
    },
    async deleteTask(id) {
      const res = await this.$store
        .dispatch('tasks/deleteTask', id)
        .catch(() => {
          return { errors: ['エラーが発生しました。'] }
        })

      if (res.errors) {
        this.errors = res.errors
      } else {
        this.fetchTasks()
        this.$toast.info('タスクを削除しました。')
      }
    }
  }
}
</script>
