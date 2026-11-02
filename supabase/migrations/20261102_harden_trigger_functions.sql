-- Applied to project pmp-portal (rbupsgbmqhbvycfjphbf) on 2026-11-02 via the Supabase connector.
-- Clears security advisor lints 0011 (mutable search_path) and 0028/0029 (SECURITY DEFINER callable over RPC).
-- Triggers keep firing; only direct calls to audit_row() through /rest/v1/rpc are blocked.

alter function public.set_updated_at() set search_path = public, pg_temp;
alter function public.protect_signed() set search_path = public, pg_temp;
alter function public.protect_rx() set search_path = public, pg_temp;
alter function public.audit_row() set search_path = public, pg_temp;
alter function public.protect_paid_invoice() set search_path = public, pg_temp;

revoke execute on function public.audit_row() from public, anon, authenticated;
