<template>
  <div class="task-table">
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
export default {
  data() {
    return {
      tasks: [],
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
    editItem(item) {
      console.log(item.title)
      this.edit(item.id)
    },
    deleteItem(item) {
      console.log(item.title)
    },
    async fetchTasks() {
      this.tasks = await this.$axios.$get('/api/v1/tasks')
    },
    async deleteTask(id) {
      const endpoint = '/api/v1/tasks/' + id
      const res = await this.$axios.$delete(endpoint)
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
