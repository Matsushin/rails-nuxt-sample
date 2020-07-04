<template>
  <v-app>
    <v-card
      color="grey lighten-4"
      flat
      tile>
      <v-toolbar :dark="true" dense color="primary">
        <v-toolbar-title v-text="title" />
        <v-spacer />
      </v-toolbar>
    </v-card>
    <v-main>
      <v-container>
        <v-row>
          <v-col cols="10" offset="1">
            <nuxt />
          </v-col>
        </v-row>
      </v-container>
    </v-main>
    <v-footer center>
      <v-layout justify-center>
        <span>&copy; Matsushin. All Rights Reserved.</span>
      </v-layout>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      title: 'Todo Sample'
    }
  }
}
</script>
