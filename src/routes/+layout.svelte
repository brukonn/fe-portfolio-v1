<script>
	import { Navbar, NavBrand, NavLi, NavUl } from 'flowbite-svelte';
	let { children } = $props();
</script>

<Navbar>
	<NavBrand href="/">
		<img src="src/lib/assets/logo.svg" height="48" alt="Logo" />
		<span>Bruno G. Bortolini</span>
	</NavBrand>
	<NavUl>
		<NavLi href="/">Home</NavLi>
		<NavLi href="/experience">Experiência</NavLi>
		<NavLi href="/projects">Projetos</NavLi>
		<NavLi href="/contacts">Contatos</NavLi>
	</NavUl>
</Navbar>

{@render children()}
