<template>
  <div>
    <section class="el-container">
      <section class="el-container is-vertical">
        <header class="el-header header">
          <div>
            <p>Todo Sample</p>
          </div>
        </header>
        <section class="el-container">
          <aside class="el-aside side-nav">
            <ul role="menu" class="el-menu">
              <li
                :class="'el-menu-item ' + activeClass('/tasks')"
                role="menuitem"
              >
                <router-link to="/tasks">
                  <i class="el-icon-edit" />
                  タスク一覧
                </router-link>
              </li>
            </ul>
          </aside>
          <main class="el-main">
            <nuxt />
          </main>
        </section>
      </section>
    </section>
  </div>
</template>

<script>
export default {
  methods: {
    activeClass(path) {
      return this.$route.path.match(path) ? 'active' : ''
    }
  }
}
</script>
