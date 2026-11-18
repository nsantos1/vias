/** Junta classes CSS, ignorando valores vazios, false, null e undefined. */
export function cn(...classes) {
  return classes.filter(Boolean).join(" ");
}
