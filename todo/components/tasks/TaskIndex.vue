<template>
  <div class="task-table">
    <v-layout column justify-center align-center>
      <v-flex xs12 sm8 md6>
        <v-card>
          <v-row justify="space-around">
            <v-col>
              <v-icon>mdi-domain</v-icon> //デフォルトのMaterial Design Icons
              <v-icon>home</v-icon> // Material Icons
              <v-icon>fas fa-lock</v-icon> //Font Awesome 5
            </v-col>
          </v-row>
        </v-card>
      </v-flex>
    </v-layout>
    <el-table
      :data="tasks"
      :row-class-name="tableRowClassName"
      stripe
      style="width: 100%"
    >
      <el-table-column
        prop="title"
        label="タスク名"
        width="180"
      />
      <el-table-column
        prop="body"
        label="タスク内容"
        width="400"
      />
      <el-table-column
        label="作成日時"
        width="240"
      >
        <template slot-scope="scope">
          <span style="margin-left: 10px">{{ formattedDate(scope.row.created_at) }}</span>
        </template>
      </el-table-column>
      <el-table-column>
        <template slot-scope="scope">
          <el-button
            @click="edit(scope.row.id)"
            type="text"
          >
            編集
          </el-button>
          <el-button
            @click="handleDeleteTask(scope.row.id)"
            type="text"
          >
            削除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tasks: []
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
