<template>
  <div id="app" class="container">
    <h1 class="text-center">Todo App</h1>

    <!-- html의 속성 값은 임의로 쌓지 못함 -->
    <input type="text" class="w-100 p-2" placeholder="Type todo" />
    <!-- prettier-ignore -->
    <input 
      type="text"
      class="w-100 p-2"
      placeholder="Type todo"
    />
    <Todo v-for="todo in todos" :key="todo.id" :todo="todo" />
    <!-- prettier-ignore -->
    <Todo 
      v-for="todo in todos"
      :key="todo.id"
      :todo="todo"
    />

    <!-- 하지만 속성 값의 길이가 printWidth 설정값인 80을 넘는다면 자동으로 쌓아짐 -->
    <Todo
      v-for="todo in todos"
      :key="todo.id"
      :todo="todo"
      :abc="abc"
      :abcd="abcd"
      :abcde="abcde"
    />
    <!-- prettier-ignore -->
    <Todo v-for="todo in todos" :key="todo.id" :todo="todo" :abc="abc" :abcd="abcd" :abcde="abcde" />
  </div>
</template>

<script>
import Todo from '@/components/Todo.vue';
export default {
  components: {
    Todo,
  },
  data() {
    return {
      todos: [
        // 오브젝트 속성의 길이가 printWidth 설정값인 80을 넘지 않는다면
        // 쌓기 or 나열 모두 가능
        {
          id: 1,
          text: 'buy a car',
          checked: false,
        },
        // or
        { id: 1, text: 'buy a car', checked: false },

        // 80자를 넘는 길이의 오브젝트는 자동으로 쌓아짐
        {
          id: 2,
          text: 'buy a car',
          checked: false,
          abc: 'abc',
          abcd: 'abcd',
          abcdefg: 'abcdefg',
        },
        // prettier-ignore
        { id: 2, text: 'buy a car', checked: false, abc: 'abc', abcd: 'abcd', abcdefg: 'abcdefg', },
      ],

      // 배열은 그 길이가 printWidth 보다 짧더라도 쌓지 못함.
      shortArray2: ['short1', 'short2', 'short3'],
      // prettier-ignore
      shortArray1: [
        'short1', 
        'short2', 
        'short3'
      ],

      // 하지만 printWidth보다 길다면 자동으로 쌓아짐
      longArray: [
        'loooooooooooooooong1',
        'looooooooooooong2',
        'loooooooooooooooong3',
        'looooooooooooong4',
      ],
    };
  },
};
</script>
