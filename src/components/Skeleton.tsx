// Skeleton loader component for loading states

interface SkeletonProps {
  className?: string;
  variant?: "text" | "card" | "avatar" | "button";
}

export function Skeleton({ className = "", variant = "text" }: SkeletonProps) {
  const baseClasses =
    "animate-pulse bg-gradient-to-r from-gray-200 via-gray-100 to-gray-200 bg-[length:200%_100%]";

  const variantClasses = {
    text: "h-4 w-full rounded",
    card: "h-32 w-full rounded-lg",
    avatar: "h-10 w-10 rounded-full",
    button: "h-10 w-24 rounded-lg",
  };

  return (
    <div
      className={`${baseClasses} ${variantClasses[variant]} ${className}`}
      aria-hidden="true"
    />
  );
}

export function LinkCardSkeleton() {
  return (
    <div className="border border-gray-200 rounded-lg p-4 space-y-3">
      <div className="flex items-center gap-3">
        <Skeleton variant="avatar" />
        <div className="flex-1 space-y-2">
          <Skeleton variant="text" className="w-1/3" />
          <Skeleton variant="text" className="w-2/3" />
        </div>
      </div>
      <Skeleton variant="text" className="w-full" />
      <div className="flex gap-2">
        <Skeleton variant="button" />
        <Skeleton variant="button" />
      </div>
    </div>
  );
}

export function SearchBarSkeleton() {
  return (
    <div className="relative flex items-center gap-2">
      <Skeleton variant="text" className="w-full h-10" />
      <Skeleton variant="button" className="w-10 h-10" />
    </div>
  );
}

export function CategorySkeleton() {
  return (
    <div className="space-y-4">
      <Skeleton variant="text" className="w-1/4 h-8" />
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <LinkCardSkeleton />
        <LinkCardSkeleton />
        <LinkCardSkeleton />
      </div>
    </div>
  );
}
