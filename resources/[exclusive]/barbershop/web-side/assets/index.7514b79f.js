(function() {
	const t = document.createElement("link").relList;
	if (t && t.supports && t.supports("modulepreload")) return;
	for (const o of document.querySelectorAll('link[rel="modulepreload"]')) r(o);
	new MutationObserver(o => {
		for (const s of o)
			if (s.type === "childList")
				for (const i of s.addedNodes) i.tagName === "LINK" && i.rel === "modulepreload" && r(i)
	}).observe(document, {
		childList: !0,
		subtree: !0
	});

	function n(o) {
		const s = {};
		return o.integrity && (s.integrity = o.integrity), o.referrerpolicy && (s.referrerPolicy = o.referrerpolicy), o.crossorigin === "use-credentials" ? s.credentials = "include" : o.crossorigin === "anonymous" ? s.credentials = "omit" : s.credentials = "same-origin", s
	}

	function r(o) {
		if (o.ep) return;
		o.ep = !0;
		const s = n(o);
		fetch(o.href, s)
	}
})();

function G() {}

function Ce(e) {
	return e()
}

function ce() {
	return Object.create(null)
}

function U(e) {
	e.forEach(Ce)
}

function Ee(e) {
	return typeof e == "function"
}

function Ie(e, t) {
	return e != e ? t == t : e !== t || e && typeof e == "object" || typeof e == "function"
}

function He(e) {
	return Object.keys(e).length === 0
}

function c(e, t) {
	e.appendChild(t)
}

function F(e, t, n) {
	e.insertBefore(t, n || null)
}

function H(e) {
	e.parentNode.removeChild(e)
}

function Me(e, t) {
	for (let n = 0; n < e.length; n += 1) e[n] && e[n].d(t)
}

function v(e) {
	return document.createElement(e)
}

function $(e) {
	return document.createElementNS("http://www.w3.org/2000/svg", e)
}

function Q(e) {
	return document.createTextNode(e)
}

function C() {
	return Q(" ")
}

function Oe() {
	return Q("")
}

function N(e, t, n, r) {
	return e.addEventListener(t, n, r), () => e.removeEventListener(t, n, r)
}

function l(e, t, n) {
	n == null ? e.removeAttribute(t) : e.getAttribute(t) !== n && e.setAttribute(t, n)
}

function Fe(e) {
	return e === "" ? null : +e
}

function Ke(e) {
	return Array.from(e.childNodes)
}

function ne(e, t) {
	t = "" + t, e.wholeText !== t && (e.data = t)
}

function fe(e, t) {
	e.value = t == null ? "" : t
}

function ue(e, t, n, r) {
	n === null ? e.style.removeProperty(t) : e.style.setProperty(t, n, r ? "important" : "")
}

function R(e, t, n) {
	e.classList[n ? "add" : "remove"](t)
}
let J;

function D(e) {
	J = e
}

function ze() {
	if (!J) throw new Error("Function called outside component initialization");
	return J
}

function Ze(e) {
	ze().$$.on_destroy.push(e)
}
const W = [],
	de = [],
	ee = [],
	me = [],
	$e = Promise.resolve();
let se = !1;

function qe() {
	se || (se = !0, $e.then(Ne))
}

function ie(e) {
	ee.push(e)
}
const oe = new Set;
let Y = 0;

function Ne() {
	const e = J;
	do {
		for (; Y < W.length;) {
			const t = W[Y];
			Y++, D(t), Qe(t.$$)
		}
		for (D(null), W.length = 0, Y = 0; de.length;) de.pop()();
		for (let t = 0; t < ee.length; t += 1) {
			const n = ee[t];
			oe.has(n) || (oe.add(n), n())
		}
		ee.length = 0
	} while (W.length);
	for (; me.length;) me.pop()();
	se = !1, oe.clear(), D(e)
}

function Qe(e) {
	if (e.fragment !== null) {
		e.update(), U(e.before_update);
		const t = e.dirty;
		e.dirty = [-1], e.fragment && e.fragment.p(e.ctx, t), e.after_update.forEach(ie)
	}
}
const Ue = new Set;

function We(e, t) {
	e && e.i && (Ue.delete(e), e.i(t))
}

function De(e, t, n, r) {
	const {
		fragment: o,
		after_update: s
	} = e.$$;
	o && o.m(t, n), r || ie(() => {
		const i = e.$$.on_mount.map(Ce).filter(Ee);
		e.$$.on_destroy ? e.$$.on_destroy.push(...i) : U(i), e.$$.on_mount = []
	}), s.forEach(ie)
}

function Ge(e, t) {
	const n = e.$$;
	n.fragment !== null && (U(n.on_destroy), n.fragment && n.fragment.d(t), n.on_destroy = n.fragment = null, n.ctx = [])
}

function Je(e, t) {
	e.$$.dirty[0] === -1 && (W.push(e), qe(), e.$$.dirty.fill(0)), e.$$.dirty[t / 31 | 0] |= 1 << t % 31
}

function Xe(e, t, n, r, o, s, i, d = [-1]) {
	const f = J;
	D(e);
	const a = e.$$ = {
		fragment: null,
		ctx: [],
		props: s,
		update: G,
		not_equal: o,
		bound: ce(),
		on_mount: [],
		on_destroy: [],
		on_disconnect: [],
		before_update: [],
		after_update: [],
		context: new Map(t.context || (f ? f.$$.context : [])),
		callbacks: ce(),
		dirty: d,
		skip_bound: !1,
		root: t.target || f.$$.root
	};
	i && i(a.root);
	let m = !1;
	if (a.ctx = n ? n(e, t.props || {}, (h, u, ...w) => {
			const y = w.length ? w[0] : u;
			return a.ctx && o(a.ctx[h], a.ctx[h] = y) && (!a.skip_bound && a.bound[h] && a.bound[h](y), m && Je(e, h)), u
		}) : [], a.update(), m = !0, U(a.before_update), a.fragment = r ? r(a.ctx) : !1, t.target) {
		if (t.hydrate) {
			const h = Ke(t.target);
			a.fragment && a.fragment.l(h), h.forEach(H)
		} else a.fragment && a.fragment.c();
		t.intro && We(e.$$.fragment), De(e, t.target, t.anchor, t.customElement), Ne()
	}
	D(f)
}
class Ye {
	$destroy() {
		Ge(this, 1), this.$destroy = G
	}
	$on(t, n) {
		if (!Ee(n)) return G;
		const r = this.$$.callbacks[t] || (this.$$.callbacks[t] = []);
		return r.push(n), () => {
			const o = r.indexOf(n);
			o !== -1 && r.splice(o, 1)
		}
	}
	$set(t) {
		this.$$set && !He(t) && (this.$$.skip_bound = !0, this.$$set(t), this.$$.skip_bound = !1)
	}
}
var ae = {
		exports: {}
	},
	q = typeof Reflect == "object" ? Reflect : null,
	pe = q && typeof q.apply == "function" ? q.apply : function(t, n, r) {
		return Function.prototype.apply.call(t, n, r)
	},
	te;
q && typeof q.ownKeys == "function" ? te = q.ownKeys : Object.getOwnPropertySymbols ? te = function(t) {
	return Object.getOwnPropertyNames(t).concat(Object.getOwnPropertySymbols(t))
} : te = function(t) {
	return Object.getOwnPropertyNames(t)
};

function et(e) {
	console && console.warn && console.warn(e)
}
var je = Number.isNaN || function(t) {
	return t !== t
};

function b() {
	b.init.call(this)
}
ae.exports = b;
ae.exports.once = ot;
b.EventEmitter = b;
b.prototype._events = void 0;
b.prototype._eventsCount = 0;
b.prototype._maxListeners = void 0;
var he = 10;

function re(e) {
	if (typeof e != "function") throw new TypeError('The "listener" argument must be of type Function. Received type ' + typeof e)
}
Object.defineProperty(b, "defaultMaxListeners", {
	enumerable: !0,
	get: function() {
		return he
	},
	set: function(e) {
		if (typeof e != "number" || e < 0 || je(e)) throw new RangeError('The value of "defaultMaxListeners" is out of range. It must be a non-negative number. Received ' + e + ".");
		he = e
	}
});
b.init = function() {
	(this._events === void 0 || this._events === Object.getPrototypeOf(this)._events) && (this._events = Object.create(null), this._eventsCount = 0), this._maxListeners = this._maxListeners || void 0
};
b.prototype.setMaxListeners = function(t) {
	if (typeof t != "number" || t < 0 || je(t)) throw new RangeError('The value of "n" is out of range. It must be a non-negative number. Received ' + t + ".");
	return this._maxListeners = t, this
};

function Ae(e) {
	return e._maxListeners === void 0 ? b.defaultMaxListeners : e._maxListeners
}
b.prototype.getMaxListeners = function() {
	return Ae(this)
};
b.prototype.emit = function(t) {
	for (var n = [], r = 1; r < arguments.length; r++) n.push(arguments[r]);
	var o = t === "error",
		s = this._events;
	if (s !== void 0) o = o && s.error === void 0;
	else if (!o) return !1;
	if (o) {
		var i;
		if (n.length > 0 && (i = n[0]), i instanceof Error) throw i;
		var d = new Error("Unhandled error." + (i ? " (" + i.message + ")" : ""));
		throw d.context = i, d
	}
	var f = s[t];
	if (f === void 0) return !1;
	if (typeof f == "function") pe(f, this, n);
	else
		for (var a = f.length, m = Re(f, a), r = 0; r < a; ++r) pe(m[r], this, n);
	return !0
};

function Pe(e, t, n, r) {
	var o, s, i;
	if (re(n), s = e._events, s === void 0 ? (s = e._events = Object.create(null), e._eventsCount = 0) : (s.newListener !== void 0 && (e.emit("newListener", t, n.listener ? n.listener : n), s = e._events), i = s[t]), i === void 0) i = s[t] = n, ++e._eventsCount;
	else if (typeof i == "function" ? i = s[t] = r ? [n, i] : [i, n] : r ? i.unshift(n) : i.push(n), o = Ae(e), o > 0 && i.length > o && !i.warned) {
		i.warned = !0;
		var d = new Error("Possible EventEmitter memory leak detected. " + i.length + " " + String(t) + " listeners added. Use emitter.setMaxListeners() to increase limit");
		d.name = "MaxListenersExceededWarning", d.emitter = e, d.type = t, d.count = i.length, et(d)
	}
	return e
}
b.prototype.addListener = function(t, n) {
	return Pe(this, t, n, !1)
};
b.prototype.on = b.prototype.addListener;
b.prototype.prependListener = function(t, n) {
	return Pe(this, t, n, !0)
};

function tt() {
	if (!this.fired) return this.target.removeListener(this.type, this.wrapFn), this.fired = !0, arguments.length === 0 ? this.listener.call(this.target) : this.listener.apply(this.target, arguments)
}

function Be(e, t, n) {
	var r = {
			fired: !1,
			wrapFn: void 0,
			target: e,
			type: t,
			listener: n
		},
		o = tt.bind(r);
	return o.listener = n, r.wrapFn = o, o
}
b.prototype.once = function(t, n) {
	return re(n), this.on(t, Be(this, t, n)), this
};
b.prototype.prependOnceListener = function(t, n) {
	return re(n), this.prependListener(t, Be(this, t, n)), this
};
b.prototype.removeListener = function(t, n) {
	var r, o, s, i, d;
	if (re(n), o = this._events, o === void 0) return this;
	if (r = o[t], r === void 0) return this;
	if (r === n || r.listener === n) --this._eventsCount === 0 ? this._events = Object.create(null) : (delete o[t], o.removeListener && this.emit("removeListener", t, r.listener || n));
	else if (typeof r != "function") {
		for (s = -1, i = r.length - 1; i >= 0; i--)
			if (r[i] === n || r[i].listener === n) {
				d = r[i].listener, s = i;
				break
			} if (s < 0) return this;
		s === 0 ? r.shift() : nt(r, s), r.length === 1 && (o[t] = r[0]), o.removeListener !== void 0 && this.emit("removeListener", t, d || n)
	}
	return this
};
b.prototype.off = b.prototype.removeListener;
b.prototype.removeAllListeners = function(t) {
	var n, r, o;
	if (r = this._events, r === void 0) return this;
	if (r.removeListener === void 0) return arguments.length === 0 ? (this._events = Object.create(null), this._eventsCount = 0) : r[t] !== void 0 && (--this._eventsCount === 0 ? this._events = Object.create(null) : delete r[t]), this;
	if (arguments.length === 0) {
		var s = Object.keys(r),
			i;
		for (o = 0; o < s.length; ++o) i = s[o], i !== "removeListener" && this.removeAllListeners(i);
		return this.removeAllListeners("removeListener"), this._events = Object.create(null), this._eventsCount = 0, this
	}
	if (n = r[t], typeof n == "function") this.removeListener(t, n);
	else if (n !== void 0)
		for (o = n.length - 1; o >= 0; o--) this.removeListener(t, n[o]);
	return this
};

function Se(e, t, n) {
	var r = e._events;
	if (r === void 0) return [];
	var o = r[t];
	return o === void 0 ? [] : typeof o == "function" ? n ? [o.listener || o] : [o] : n ? rt(o) : Re(o, o.length)
}
b.prototype.listeners = function(t) {
	return Se(this, t, !0)
};
b.prototype.rawListeners = function(t) {
	return Se(this, t, !1)
};
b.listenerCount = function(e, t) {
	return typeof e.listenerCount == "function" ? e.listenerCount(t) : Ve.call(e, t)
};
b.prototype.listenerCount = Ve;

function Ve(e) {
	var t = this._events;
	if (t !== void 0) {
		var n = t[e];
		if (typeof n == "function") return 1;
		if (n !== void 0) return n.length
	}
	return 0
}
b.prototype.eventNames = function() {
	return this._eventsCount > 0 ? te(this._events) : []
};

function Re(e, t) {
	for (var n = new Array(t), r = 0; r < t; ++r) n[r] = e[r];
	return n
}

function nt(e, t) {
	for (; t + 1 < e.length; t++) e[t] = e[t + 1];
	e.pop()
}

function rt(e) {
	for (var t = new Array(e.length), n = 0; n < t.length; ++n) t[n] = e[n].listener || e[n];
	return t
}

function ot(e, t) {
	return new Promise(function(n, r) {
		function o(i) {
			e.removeListener(t, s), r(i)
		}

		function s() {
			typeof e.removeListener == "function" && e.removeListener("error", o), n([].slice.call(arguments))
		}
		Te(e, t, s, {
			once: !0
		}), t !== "error" && st(e, o, {
			once: !0
		})
	})
}

function st(e, t, n) {
	typeof e.on == "function" && Te(e, "error", t, n)
}

function Te(e, t, n, r) {
	if (typeof e.on == "function") r.once ? e.once(t, n) : e.on(t, n);
	else if (typeof e.addEventListener == "function") e.addEventListener(t, function o(s) {
		r.once && e.removeEventListener(t, o), n(s)
	});
	else throw new TypeError('The "emitter" argument must be of type EventEmitter. Received type ' + typeof e)
}
let removedButton = {};
const le = new ae.exports.EventEmitter;
window.addEventListener("message", e => le.emit(e.data.name, e.data.payload));
window.addEventListener("message", function(event){
    switch(event.data.mode){
        case "barber":
            var innerDiv = document.querySelector('div.w-full > button');
            if(innerDiv) {
                innerDiv.parentNode.removeChild(innerDiv);
            }
			document.querySelectorAll('button').forEach(button => {
                if (button.textContent === 'Finalizar') {
					button.textContent = 'Salvar';
                    if (removedButton) {
                        button.parentNode.insertBefore(removedButton, button.nextSibling);
                        removedButton = null;
                    }
                }
            });  
			break;
		case "spawn":
			document.querySelectorAll('button').forEach(button => {
				if (button.textContent === 'Cancelar') {
					removedButton = button;
					button.remove();
				}
				if (button.textContent === 'Salvar') {
					button.textContent = 'Finalizar';
				}
			});
        break;
    }
});

function it(e, t) {
	le.on(e, t), Ze(() => le.removeListener(e, t))
}
async function Z(e, t) {
	var i;
	const n = (i = window.GetParentResourceName) == null ? void 0 : i.call(window),
		r = new URL(e, `http://${n}/`),
		o = {
			method: "POST",
			body: JSON.stringify(t)
		};
	return await (await fetch(r, o)).json()
}
const be = [
	["#1c1f21", "#272a2c", "#312e2c", "#35261c", "#4b321f", "#5c3b24", "#6d4c35", "#6b503b", "#765c45", "#7f684e", "#99815d", "#a79369", "#af9c70", "#bba063", "#d6b97b", "#dac38e", "#9f7f59", "#845039", "#682b1f", "#61120c", "#640f0a", "#7c140f", "#a02e19", "#b64b28", "#a2502f", "#aa4e2b", "#626262", "#808080", "#aaaaaa", "#c5c5c5", "#463955", "#5a3f6b", "#763c76", "#ed74e3", "#eb4b93", "#f299bc", "#04959e", "#025f86", "#023974", "#3fa16a", "#217c61", "#185c55", "#b6c034", "#70a90b", "#439d13", "#dcb857", "#e5b103", "#e69102", "#f28831", "#fb8057", "#e28b58", "#d1593c", "#ce3120", "#ad0903", "#880302", "#1f1814", "#291f19", "#2e221b", "#37291e", "#2e2218", "#231b15", "#020202", "#706c66", "#9d7a50"],
	["#992532", "#c8395d", "#bd516c", "#b8637a", "#a6526b", "#b1434c", "#7f3133", "#a4645d", "#c18779", "#cba096", "#c6918f", "#ab6f63", "#b06050", "#a84c33", "#b47178", "#ca7f92", "#ed9cbe", "#e775a4", "#de3e81", "#b34c6e", "#712739", "#4f1f2a", "#aa222f", "#de2034", "#cf0813", "#e55470", "#dc3fb5", "#c227b2", "#a01ca9", "#6e1875", "#731465", "#56165c", "#6d1a9d", "#1b3771", "#1d4ea7", "#1e74bb", "#21a3ce", "#25c2d2", "#23cca5", "#27c07d", "#1b9c32", "#148604", "#70d041", "#c5ea34", "#e1e32f", "#ffdd26", "#fac026", "#f78a27", "#fe5910", "#be6e19", "#f7c97f", "#fbe5c0", "#f5f5f5", "#b3b4b3", "#919191", "#564e4e", "#180e0e", "#58969e", "#4d6f8c", "#1a2b55", "#a07e6b", "#826355", "#6d5346", "#3e2d27"]
];

function ve(e, t, n) {
	const r = e.slice();
	return r[21] = t[n][0], r[22] = t[n][1], r[23] = t, r[24] = n, r
}

function ge(e, t, n) {
	const r = e.slice();
	return r[25] = t[n], r[27] = n, r
}

function _e(e) {
	let t, n, r, o, s, i, d, f, a, m, h, u, w, y, A, T = e[3][e[2]].title + "",
		B, _, j, I, E, p, x, M, P, K, S = Object.entries(e[3][e[2]].items),
		L = [];
	for (let g = 0; g < S.length; g += 1) L[g] = xe(ve(e, S, g));
	return {
		c() {
			t = v("div"), n = v("div"), r = v("div"), o = v("button"), o.innerHTML = '<svg class="w-[2.3125rem] h-[1.3125rem]" viewBox="0 0 37 21" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M2.75 14.6L2.15015 15.7654C1.515 16.9994 2.00075 18.5147 3.23496 19.1494C4.2176 19.6548 5.41508 19.4588 6.18534 18.6665L8.15523 16.6403C8.56821 16.2155 9.0388 15.8508 9.55319 15.5569L15.9145 11.9219C16.9876 11.3087 18.1163 10.7982 19.2855 10.3974C23.7924 8.85214 28.7076 8.99969 33.1137 10.8125L35.8772 11.9495C35.9048 11.9609 35.9283 11.9262 35.9074 11.9048L26.2778 2L17.2028 4.00019C14.2118 4.65944 11.3916 5.93678 8.92331 7.75022C6.89689 9.23902 5.14107 11.0646 3.73235 13.1475L2.75 14.6Z" stroke="#4182E2" stroke-width="2"></path></svg>', s = C(), i = v("button"), i.innerHTML = '<svg class="w-[2.3125rem] h-8" viewBox="0 0 37 32" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M6.83333 10.6771L6.01624 10.9483C4.65535 11.4 3.48352 12.2918 2.68554 13.4832V13.4832C2.21459 14.1863 1.88643 14.9751 1.71974 15.8047L1.45145 17.14C1.15268 18.627 1.1101 20.1541 1.32556 21.6555L1.37522 22.0015C1.76603 24.7248 2.88157 27.2929 4.60511 29.4373L5.83099 30.9625C5.84295 30.9774 5.86682 30.9716 5.87058 30.9529L6.52454 27.6984C6.72948 26.6786 7.06994 25.6907 7.53687 24.7611V24.7611C8.35284 23.1365 8.77778 21.3438 8.77778 19.5259V16.5344C8.77778 16.514 8.80128 16.5027 8.81719 16.5154L11.2706 18.4691C12.8269 19.7084 14.6569 20.5577 16.608 20.9462L17.2871 21.0814C18.0909 21.2415 18.9146 21.2771 19.7292 21.187L21.4067 21.0014C24.6852 20.6387 27.6761 22.9 28.2208 26.1533V26.1533C28.2215 26.1574 28.226 26.1597 28.2297 26.1578V26.1578C32.9846 23.7913 36 18.9329 36 13.6216V8.79451C36 8.77512 35.9766 8.76538 35.9628 8.77906L30.7035 14.0138C30.6952 14.022 30.6816 14.0132 30.6856 14.0023L31.053 13.0069C32.7613 8.37799 30.7049 3.2034 26.2877 1.00492V1.00492C26.2831 1.00266 26.2778 1.00596 26.2778 1.01104V1.41701C26.2778 4.52645 24.0284 7.17953 20.9608 7.68816V7.68816C20.6172 7.74515 20.2694 7.77378 19.921 7.77378L13.6389 7.77378H12.272C10.0884 7.77378 8.04848 8.86271 6.83333 10.6771V10.6771ZM6.83333 10.6771L9.81728 12.1624C12.9367 13.7152 16.4599 14.2655 19.9043 13.738L20.342 13.671C24.7439 12.9969 28.6608 10.5066 31.1389 6.80655V6.80655" stroke="#4182E2" stroke-width="2"></path></svg>', d = C(), f = v("button"), f.innerHTML = '<svg class="w-8 h-8" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M19.75 14.1515L20.7542 13.8161C23.749 12.8158 26.3246 10.8454 28.0736 8.21668V8.21668C28.7714 7.16781 29.3265 6.03068 29.7242 4.83528L30.6484 2.05695C30.713 1.86269 31 1.90917 31 2.11389L31 12.3289C31 18.2214 28.2825 23.7845 23.6349 27.4067V27.4067C22.9209 27.9631 22.1682 28.4682 21.3826 28.918L20.6409 29.3427C17.7659 30.9888 14.2341 30.9888 11.3591 29.3427L10.6174 28.918C9.83178 28.4682 9.07914 27.9631 8.36514 27.4067V27.4067C3.71747 23.7845 1 18.2214 1 12.3289L1 2.11389C1 1.90917 1.28698 1.86269 1.35161 2.05695L2.27585 4.83528C2.67351 6.03068 3.22858 7.16781 3.92642 8.21668V8.21668C5.67538 10.8454 8.25104 12.8158 11.2458 13.8161L12.25 14.1515" stroke="#4182E2" stroke-width="2"></path><path d="M9 15.25H6.87103L8.23038 16.8885L8.48082 17.1904C10.3874 19.4885 13.8383 19.6905 16 17.639C18.1617 19.6905 21.6126 19.4885 23.5192 17.1904L23.7696 16.8885L25.129 15.25L23 15.25H22.0176C21.3498 15.25 20.6991 15.0394 20.158 14.648L19.5921 15.4305L20.158 14.648L18.9153 13.7493L18.3293 14.5596L18.9153 13.7493C18.141 13.1893 17.1219 13.0989 16.2611 13.5139L16.6954 14.4147L16.2611 13.5139C16.0961 13.5935 15.9039 13.5935 15.7389 13.5139L15.3046 14.4147L15.7389 13.5139C14.8781 13.0989 13.859 13.1893 13.0847 13.7493L11.842 14.648L12.428 15.4583L11.842 14.648C11.3009 15.0393 10.6502 15.25 9.98239 15.25H9Z" stroke="#4182E2" stroke-width="2"></path></svg>', a = C(), m = v("button"), m.innerHTML = '<svg class="w-[2.0625rem] h-[2.0625rem]" viewBox="0 0 33 33" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M32.005 0.989083C31.3435 0.334061 30.466 0 29.5884 0C28.7894 0 27.9839 0.275109 27.3421 0.838428L7.49861 18.3275L7.42657 18.3406C6.31324 18.5502 4.19791 19.0742 2.47552 20.2271C0.838272 21.3275 0 22.7031 0 24.321C0.006549 29.1026 3.89666 33 8.67743 33C10.295 33 11.6703 32.1616 12.7771 30.5175C13.9297 28.8013 14.4537 26.679 14.6632 25.5655L14.6763 25.4935L32.1687 5.64629C33.3344 4.29694 33.2689 2.25327 32.005 0.989083ZM12.4824 24.8581C12.3056 25.8406 11.3036 30.7336 8.67743 30.7336C5.14752 30.7271 2.2725 27.8515 2.26596 24.321C2.26596 21.6943 7.15806 20.6921 8.14041 20.5153L8.27794 20.4891L12.5086 24.714L12.4824 24.8581ZM13.9166 22.9258L10.0724 19.0808L13.2683 16.2642L16.7327 19.7293L13.9166 22.9258ZM30.466 4.14629L18.239 18.0262L14.9776 14.7642L28.8418 2.54148C29.0776 2.33843 29.3723 2.24672 29.6735 2.26638C29.9813 2.29258 30.2564 2.43013 30.4529 2.65939C30.8262 3.0917 30.8262 3.71397 30.466 4.14629Z" fill="#4182E2"></path></svg>', h = C(), u = v("button"), u.innerHTML = '<svg class="w-[2.6875rem] h-6" viewBox="0 0 43 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M41 9.8L28.37 2.31913C28.124 2.17344 27.8635 2.0538 27.5927 1.96215V1.96215C25.8991 1.38893 24.0292 1.97582 22.9669 3.414L21.506 5.39185C21.503 5.3959 21.497 5.3959 21.494 5.39185L20.0331 3.414C18.9708 1.97582 17.1009 1.38893 15.4073 1.96215V1.96215C15.1365 2.0538 14.876 2.17344 14.63 2.31913L2 9.8M41 9.8L40.243 11.3373C36.7269 18.4777 29.4591 23 21.5 23V23V23C13.5409 23 6.27311 18.4777 2.75701 11.3373L2 9.8M41 9.8L32.6276 12.3504C30.996 12.8474 29.2997 13.1 27.5941 13.1V13.1C25.7107 13.1 23.84 12.792 22.0561 12.1882L21.5067 12.0023C21.5023 12.0008 21.4977 12.0008 21.4933 12.0023L20.9439 12.1882C19.16 12.792 17.2893 13.1 15.4059 13.1V13.1C13.7003 13.1 12.004 12.8474 10.3724 12.3504L2 9.8" stroke="#4182E2" stroke-width="2"></path></svg>', w = C(), y = v("div"), A = v("span"), B = Q(T), _ = C(), j = v("div");
			for (let g = 0; g < L.length; g += 1) L[g].c();
			I = C(), E = v("div"), p = v("button"), p.textContent = "Cancelar", x = C(), M = v("button"), M.textContent = "Salvar", l(o, "class", "w-[4.5rem] h-[4.5rem] grid place-items-center bg-black/[0.18] rounded svelte-1vyyw8w"), R(o, "selected", e[2] === "appearance"), l(i, "class", "w-[4.5rem] h-[4.5rem] grid place-items-center bg-black/[0.18] rounded svelte-1vyyw8w"), R(i, "selected", e[2] === "hair"), l(f, "class", "w-[4.5rem] h-[4.5rem] grid place-items-center bg-black/[0.18] rounded svelte-1vyyw8w"), R(f, "selected", e[2] === "beard"), l(m, "class", "w-[4.5rem] h-[4.5rem] grid place-items-center bg-black/[0.18] rounded svelte-1vyyw8w"), R(m, "selected", e[2] === "makeup"), l(u, "class", "w-[4.5rem] h-[4.5rem] grid place-items-center bg-black/[0.18] rounded svelte-1vyyw8w"), R(u, "selected", e[2] === "lipstick"), l(r, "class", "w-full flex flex-row items-center justify-center gap-[0.9375rem]"), l(A, "class", "text-2xl font-semibold tracking-wider"), l(j, "class", "h-[36.0625rem] grid place-content-start space-y-4 overflow-hidden overflow-y-auto no-scrollbar"), l(y, "class", "flex flex-col items-start space-y-1"), l(p, "class", "h-14 flex-1 text-cr font-normal tracking-wider hover:bg-black/20 uppercase"), l(M, "class", "h-14 flex-1 text-cr font-normal tracking-wider hover:bg-black/20 uppercase"), l(E, "class", "w-[26.25rem] h-14 flex flex-row bg-black/60 overflow-hidden rounded-[0.4375rem]"), l(n, "class", "w-[31.8125rem] h-[54.625rem] ml-20 relative flex flex-col items-center justify-center space-y-16"), l(t, "class", "fixed inset-0 grid items-center justify-start text-white font-poppins " + (location.port === "5173" && "bg-black/50") + " bg-[url('./assets/bg_cr.png')] bg-no-repeat bg-center bg-cover select-none svelte-1vyyw8w")
		},
		m(g, O) {
			F(g, t, O), c(t, n), c(n, r), c(r, o), c(r, s), c(r, i), c(r, d), c(r, f), c(r, a), c(r, m), c(r, h), c(r, u), c(n, w), c(n, y), c(y, A), c(A, B), c(y, _), c(y, j);
			for (let k = 0; k < L.length; k += 1) L[k].m(j, null);
			c(n, I), c(n, E), c(E, p), c(E, x), c(E, M), P || (K = [N(o, "click", e[7]), N(i, "click", e[8]), N(f, "click", e[9]), N(m, "click", e[10]), N(u, "click", e[11]), N(p, "click", e[17]), N(M, "click", e[18])], P = !0)
		},
		p(g, O) {
			if (O & 4 && R(o, "selected", g[2] === "appearance"), O & 4 && R(i, "selected", g[2] === "hair"), O & 4 && R(f, "selected", g[2] === "beard"), O & 4 && R(m, "selected", g[2] === "makeup"), O & 4 && R(u, "selected", g[2] === "lipstick"), O & 12 && T !== (T = g[3][g[2]].title + "") && ne(B, T), O & 46) {
				S = Object.entries(g[3][g[2]].items);
				let k;
				for (k = 0; k < S.length; k += 1) {
					const X = ve(g, S, k);
					L[k] ? L[k].p(X, O) : (L[k] = xe(X), L[k].c(), L[k].m(j, null))
				}
				for (; k < L.length; k += 1) L[k].d(1);
				L.length = S.length
			}
		},
		d(g) {
			g && H(t), Me(L, g), P = !1, U(K)
		}
	}
}

function ye(e) {
	let t, n, r, o = e[22].text + "",
		s, i, d, f = e[1][e[22].key].toFixed(1) + "",
		a, m, h, u, w, y, A, T, B, _, j, I, E, p, x, M, P, K, S, L;

	function g() {
		return e[12](e[22])
	}

	function O() {
		e[13].call(_, e[22])
	}

	function k(...z) {
		return e[14](e[22], ...z)
	}

	function X() {
		return e[15](e[22])
	}
	return {
		c() {
			t = v("div"), n = v("div"), r = v("span"), s = Q(o), i = C(), d = v("span"), a = Q(f), m = C(), h = v("div"), u = v("button"), w = $("svg"), y = $("path"), T = C(), B = v("div"), _ = v("input"), p = C(), x = v("button"), M = $("svg"), P = $("path"), l(r, "class", "text-base text-white/50 font-normal tracking-wider"), l(d, "class", "text-base text-white/70 font-normal tracking-wider"), l(n, "class", "flex flex-row items-center justify-between"), l(y, "d", "M7 0.999999L0.999999 7L7 13"), l(y, "stroke", "#4182E2"), l(y, "stroke-width", "2"), l(y, "stroke-linecap", "round"), l(y, "stroke-linejoin", "round"), l(w, "class", "w-2 h-[0.875rem] grid place-items-center"), l(w, "viewBox", "0 0 8 14"), l(w, "fill", "none"), l(w, "xmlns", "http://www.w3.org/2000/svg"), u.disabled = A = e[1][e[22].key] <= e[22].min, l(u, "class", "w-12 h-14 grid place-items-center hover:bg-cr/10"), l(_, "type", "range"), l(_, "min", j = e[22].min), l(_, "max", I = e[22].max), l(_, "step", E = e[22].max < 1 ? "0.01" : e[22].step || "1"), l(_, "class", "w-[17.5rem] h-1 bg-cr/10 outline-none appearance-none rounded svelte-1vyyw8w"), l(B, "class", "w-[20.25rem] h-14 grid place-items-center"), l(P, "d", "M1 13L7 7L1 1"), l(P, "stroke", "#4182E2"), l(P, "stroke-width", "2"), l(P, "stroke-linecap", "round"), l(P, "stroke-linejoin", "round"), l(M, "class", "w-2 h-[0.875rem] grid place-items-center"), l(M, "viewBox", "0 0 8 14"), l(M, "fill", "none"), l(M, "xmlns", "http://www.w3.org/2000/svg"), x.disabled = K = e[1][e[22].key] >= e[22].max, l(x, "class", "w-12 h-14 grid place-items-center hover:bg-cr/10"), l(h, "class", "flex flex-row items-center bg-black/[0.58] overflow-hidden rounded-[0.4375rem]"), l(t, "class", "w-[26.25rem] h-[5.3125rem] flex flex-col space-y-2")
		},
		m(z, V) {
			F(z, t, V), c(t, n), c(n, r), c(r, s), c(n, i), c(n, d), c(d, a), c(t, m), c(t, h), c(h, u), c(u, w), c(w, y), c(h, T), c(h, B), c(B, _), fe(_, e[1][e[22].key]), c(h, p), c(h, x), c(x, M), c(M, P), S || (L = [N(u, "click", g), N(_, "change", O), N(_, "input", O), N(_, "input", k), N(x, "click", X)], S = !0)
		},
		p(z, V) {
			e = z, V & 12 && o !== (o = e[22].text + "") && ne(s, o), V & 14 && f !== (f = e[1][e[22].key].toFixed(1) + "") && ne(a, f), V & 14 && A !== (A = e[1][e[22].key] <= e[22].min) && (u.disabled = A), V & 12 && j !== (j = e[22].min) && l(_, "min", j), V & 12 && I !== (I = e[22].max) && l(_, "max", I), V & 12 && E !== (E = e[22].max < 1 ? "0.01" : e[22].step || "1") && l(_, "step", E), V & 14 && fe(_, e[1][e[22].key]), V & 14 && K !== (K = e[1][e[22].key] >= e[22].max) && (x.disabled = K)
		},
		d(z) {
			z && H(t), S = !1, U(L)
		}
	}
}

function we(e) {
	let t, n, r = e[22].text + "",
		o, s, i, d, f = be[e[22].color],
		a = [];
	for (let m = 0; m < f.length; m += 1) a[m] = Le(ge(e, f, m));
	return {
		c() {
			t = v("div"), n = v("span"), o = Q(r), s = C(), i = v("div");
			for (let m = 0; m < a.length; m += 1) a[m].c();
			d = C(), l(n, "class", "text-base text-white/50 font-normal tracking-wider"), l(i, "class", "w-[26.25rem] h-[13.375rem] p-6 grid grid-cols-12 place-items-center bg-black/[0.58] overflow-hidden rounded-[0.4375rem]"), l(t, "class", "flex flex-col space-y-2")
		},
		m(m, h) {
			F(m, t, h), c(t, n), c(n, o), c(t, s), c(t, i);
			for (let u = 0; u < a.length; u += 1) a[u].m(i, null);
			c(t, d)
		},
		p(m, h) {
			if (h & 12 && r !== (r = m[22].text + "") && ne(o, r), h & 46) {
				f = be[m[22].color];
				let u;
				for (u = 0; u < f.length; u += 1) {
					const w = ge(m, f, u);
					a[u] ? a[u].p(w, h) : (a[u] = Le(w), a[u].c(), a[u].m(i, null))
				}
				for (; u < a.length; u += 1) a[u].d(1);
				a.length = f.length
			}
		},
		d(m) {
			m && H(t), Me(a, m)
		}
	}
}

function ke(e) {
	let t, n;
	return {
		c() {
			t = $("svg"), n = $("path"), l(n, "d", "M13 1.5L4.75 9.75L1 6"), l(n, "stroke", "white"), l(n, "stroke-opacity", "0.5"), l(n, "stroke-width", "1.5"), l(n, "stroke-linecap", "round"), l(n, "stroke-linejoin", "round"), l(t, "class", "w-[0.875rem] h-[0.6875rem]"), l(t, "viewBox", "0 0 14 11"), l(t, "fill", "none"), l(t, "xmlns", "http://www.w3.org/2000/svg")
		},
		m(r, o) {
			F(r, t, o), c(t, n)
		},
		d(r) {
			r && H(t)
		}
	}
}

function Le(e) {
	let t, n, r, o, s = e[1][e[22].key] === e[27] && ke();

	function i() {
		return e[16](e[22], e[27])
	}
	return {
		c() {
			t = v("button"), s && s.c(), n = C(), ue(t, "background", e[25]), l(t, "class", "w-[1.375rem] h-[1.375rem] grid place-items-center border-[0.5px] border-white/50 rounded-[0.1875rem]")
		},
		m(d, f) {
			F(d, t, f), s && s.m(t, null), c(t, n), r || (o = N(t, "click", i), r = !0)
		},
		p(d, f) {
			e = d, e[1][e[22].key] === e[27] ? s || (s = ke(), s.c(), s.m(t, n)) : s && (s.d(1), s = null), f & 12 && ue(t, "background", e[25])
		},
		d(d) {
			d && H(t), s && s.d(), r = !1, o()
		}
	}
}

function xe(e) {
	let t, n, r = e[22].color === !1 && ye(e),
		o = e[22].color !== !1 && we(e);
	return {
		c() {
			r && r.c(), t = C(), o && o.c(), n = Oe()
		},
		m(s, i) {
			r && r.m(s, i), F(s, t, i), o && o.m(s, i), F(s, n, i)
		},
		p(s, i) {
			s[22].color === !1 ? r ? r.p(s, i) : (r = ye(s), r.c(), r.m(t.parentNode, t)) : r && (r.d(1), r = null), s[22].color !== !1 ? o ? o.p(s, i) : (o = we(s), o.c(), o.m(n.parentNode, n)) : o && (o.d(1), o = null)
		},
		d(s) {
			r && r.d(s), s && H(t), o && o.d(s), s && H(n)
		}
	}
}

function lt(e) {
	let t, n = e[0] && _e(e);
	return {
		c() {
			n && n.c(), t = Oe()
		},
		m(r, o) {
			n && n.m(r, o), F(r, t, o)
		},
		p(r, [o]) {
			r[0] ? n ? n.p(r, o) : (n = _e(r), n.c(), n.m(t.parentNode, t)) : n && (n.d(1), n = null)
		},
		i: G,
		o: G,
		d(r) {
			n && n.d(r), r && H(t)
		}
	}
}

function at(e, t, n) {
	let r, o, s, i, d = location.port === "5173" || !1;
	it("Open", p => {
		n(1, s = p[0]), n(6, r = p[1]), n(0, d = !0)
	}), window.addEventListener("keydown", p => {
		p.code === "KeyA" && Z("Rotate", "Left"), p.code === "KeyD" && Z("Rotate", "Right"), p.code === "Escape" && (Z("Cancel"), n(0, d = !1))
	});

	function f(p) {
		n(2, o = p)
	}

	function a(p, x) {
		n(1, s[p] = x, s), Z("Update", s)
	}
	const m = () => f("appearance"),
		h = () => f("hair"),
		u = () => f("beard"),
		w = () => f("makeup"),
		y = () => f("lipstick"),
		A = p => a(p.key, n(1, s[p.key] -= p.step, s));

	function T(p) {
		s[p.key] = Fe(this.value), n(1, s)
	}
	const B = (p, x) => a(p.key, Number(x.target.value)),
		_ = p => a(p.key, n(1, s[p.key] += p.step, s)),
		j = (p, x) => a(p.key, n(1, s[p.key] = x, s)),
		I = () => (Z("Cancel"), f("hair"), n(0, d = !1)),
		E = () => (Z("Finish", s), f("hair"), n(0, d = !1));
	return e.$$.update = () => {
		e.$$.dirty & 64 && n(3, i = {
			appearance: {
				title: "Apar\xEAncia",
				items: [{
					key: 0,
					text: "Pai",
					min: 0,
					max: 24,
					step: 1,
					color: !1
				}, {
					key: 1,
					text: "M\xE3e",
					min: 0,
					max: 22,
					step: 1,
					color: !1
				}, {
					key: 2,
					text: "Parentesco",
					min: 0,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 3,
					text: "Cor dos Olhos",
					min: 0,
					max: 31,
					step: 1,
					color: !1
				}, {
					key: 4,
					text: "Cor da Pele",
					min: 0,
					max: 12,
					step: 1,
					color: !1
				}, {
					key: 5,
					text: "Acne",
					min: 0,
					max: 23,
					step: 1,
					color: !1
				}, {
					key: 6,
					text: "Manchas",
					min: -1,
					max: 23,
					step: 1,
					color: !1
				}, {
					key: 7,
					text: "Sardas",
					min: -1,
					max: 17,
					step: 1,
					color: !1
				}, {
					key: 8,
					text: "Envelhecimento",
					min: -1,
					max: 14,
					step: 1,
					color: !1
				}, {
					key: 27,
					text: "Largura do Nariz",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 28,
					text: "Altura do Nariz",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 29,
					text: "Comprimento do Nariz",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 30,
					text: "Curvatura do Nariz",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 31,
					text: "Ponta do Nariz",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 32,
					text: "Suavidade do Nariz",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 33,
					text: "Tamanho da Testa",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 34,
					text: "Altura da Olheira",
					min: 0,
					max: 10,
					step: 1,
					color: !1
				}, {
					key: 35,
					text: "Tamanho da Olheira",
					min: 0,
					max: 10,
					step: 1,
					color: !1
				}, {
					key: 36,
					text: "Altura da Mand\xEDbula",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 37,
					text: "Comprimento do Queixo",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 38,
					text: "Largura do Queixo",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 39,
					text: "Posi\xE7\xE3o do Queixo",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 40,
					text: "Covas do Queixo",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 41,
					text: "Preenchimento dos L\xE1bios",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 42,
					text: "Largura do Pesco\xE7o",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 43,
					text: "Altura das Sobrancelhas",
					min: -1,
					max: .99,
					step: .01,
					color: !1
				}]
			},
			hair: {
				title: "Cabelos",
				items: [{
					key: 9,
					text: "Cabelo",
					min: 0,
					max: r,
					step: 1,
					color: !1
				}, {
					key: 10,
					text: "Cor do Cabelo",
					min: 0,
					max: 0,
					step: 1,
					color: 0
				}, {
					key: 11,
					text: "Reflexo do Cabelo",
					min: 0,
					max: 0,
					step: 1,
					color: 0
				}, {
					key: 18,
					text: "Sobrancelha",
					min: 0,
					max: 33,
					step: 1,
					color: !1
				}, {
					key: 19,
					text: "Intensidade da Sobrancelha",
					min: 0,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 20,
					text: "Cor da Sobrancelha",
					min: 0,
					max: 0,
					step: 1,
					color: 0
				}]
			},
			beard: {
				title: "Barbas",
				items: [{
					key: 21,
					text: "Barba",
					min: 0,
					max: 28,
					step: 1,
					color: !1
				}, {
					key: 22,
					text: "Intensidade da Barba",
					min: 0,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 23,
					text: "Cor da Barba",
					min: 0,
					max: 0,
					step: 1,
					color: 0
				}]
			},
			eyebrow: {
				title: "Sobrancelhas",
				items: [{
					key: 18,
					text: "Sobrancelha",
					min: 0,
					max: 33,
					step: 1,
					color: !1
				}, {
					key: 19,
					text: "Intensidade da Sobrancelha",
					min: 0,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 20,
					text: "Cor da Sobrancelha",
					min: 0,
					max: 0,
					step: 1,
					color: 0
				}]
			},
			makeup: {
				title: "Maquiagens",
				items: [{
					key: 12,
					text: "Maquiagem",
					min: 0,
					max: 74,
					step: 1,
					color: !1
				}, {
					key: 13,
					text: "Intensidade da Maquiagem",
					min: 0,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 14,
					text: "Cor da Maquiagem",
					min: 0,
					max: 0,
					step: 1,
					color: 1
				}, {
					key: 24,
					text: "Blush",
					min: 0,
					max: 32,
					step: 1,
					color: !1
				}, {
					key: 25,
					text: "Intensidade do Blush",
					min: 0,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 26,
					text: "Cor do Blush",
					min: 0,
					max: 0,
					step: 1,
					color: 1
				}]
			},
			lipstick: {
				title: "Batons",
				items: [{
					key: 15,
					text: "Batom",
					min: 0,
					max: 9,
					step: 1,
					color: !1
				}, {
					key: 16,
					text: "Intensidade do Batom",
					min: 0,
					max: .99,
					step: .01,
					color: !1
				}, {
					key: 17,
					text: "Cor do Batom",
					min: 0,
					max: 0,
					step: 1,
					color: 1
				}]
			}
		})
	}, n(6, r = void 0), n(2, o = "hair"), n(1, s = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]), [d, s, o, i, f, a, r, m, h, u, w, y, A, T, B, _, j, I, E]
}
class ct extends Ye {
	constructor(t) {
		super(), Xe(this, t, at, lt, Ie, {})
	}
}
new ct({
	target: document.getElementById("app")
});