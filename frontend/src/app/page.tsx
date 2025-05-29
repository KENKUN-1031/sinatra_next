import Image from "next/image";


export default async function Home() {
  // Sinatra 側の /api/items エンドポイントからデータを取得
  const API_URL = process.env.NEXT_PUBLIC_API_URL; // "http://backend:8080/"
  const res = await fetch(`${API_URL}api/items`, { cache: 'no-store' });
  console.log("-----------------------");
  console.log('fetch res:', res);
  if (!res.ok) {
    return (
      <div>
        <h1>API通信</h1>
        <p>データの取得に失敗しました。（{res.status}）</p>
      </div>
    );
  }
  const { items } = await res.json() as { items: { id: number; name: string }[] };

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-4">API通信</h1>
      {items.length > 0 ? (
        <ul className="list-disc pl-5 space-y-2">
          {items.map(item => (
            <li key={item.id}>
              {item.id}. {item.name}
            </li>
          ))}
        </ul>
      ) : (
        <p>No items found.</p>
      )}
    </div>
  );
}
